using System;

namespace COServer.Game.MsgServer
{
    public static class MsgNewRole
    {

        public static object SynName = new object();


        public static void GetNewRoleInfo(this ServerSockets.Packet msg, out string name, out ushort Body, out byte Class)
        {
            msg.ReadBytes(16);
            name = msg.ReadCString(16);//20
            msg.ReadBytes(16);
            Body = msg.ReadUInt16();
            Class = msg.ReadUInt8();

        }

        [PacketAttribute(Game.GamePackets.NewClient)]
        public unsafe static void CreateCharacter(Client.GameClient client, ServerSockets.Packet stream)
        {
            if ((client.ClientFlag & Client.ServerFlag.CreateCharacter) == Client.ServerFlag.CreateCharacter)
            {
                client.ClientFlag &= ~Client.ServerFlag.AcceptLogin;


                string CharacterName; ushort Body; byte Class;

                stream.GetNewRoleInfo(out CharacterName, out Body, out Class);

                //last update
                //switch (Class)
                //{
                //    case 0:
                //    case 1: Class = 100; break;
                //    case 2:
                //    case 3: Class = 10; break;
                //    case 4:
                //    case 5: Class = 40; break;
                //    case 6:
                //    case 7: Class = 20; break;
                //    case 8:
                //    case 9: Class = 50; break;
                //    case 10:
                //    case 11: Class = 60; break;
                //}


                if (!ExitBody(Body))
                {
                    client.Send(new MsgServer.MsgMessage("Wrong body.", MsgMessage.MsgColor.red, MsgMessage.ChatMode.PopUP).GetArray(stream));
                    return;
                }
                if (!ExitClass(Class))
                {
                    client.Send(new MsgServer.MsgMessage("Wrong class.", MsgMessage.MsgColor.red, MsgMessage.ChatMode.PopUP).GetArray(stream));
                    return;
                }

                CharacterName = CharacterName.Replace("\0", "");
                if (Program.NameStrCheck(CharacterName))
                {
                    if (!Database.Server.NameUsed.Contains(CharacterName.GetHashCode()))
                    {
                        client.ClientFlag &= ~Client.ServerFlag.CreateCharacter;

                        lock (Database.Server.NameUsed)
                            Database.Server.NameUsed.Add(CharacterName.GetHashCode());

                        client.Player.Name = CharacterName;
                        client.Player.Class = Class;
                        client.Player.Body = Body;
                        client.Player.Level = 1;
                        client.Player.Map = 1002    ;
                        client.Player.X = 422;
                        client.Player.Y = 375;
                        client.Player.Money += 10000;

                        //if (DateTime.Now > client.Player.ExpireVip)
                        //    client.Player.ExpireVip = DateTime.Now.AddDays(1);
                        //else
                        //    client.Player.ExpireVip = client.Player.ExpireVip.AddDays(1);

                        //client.Player.VipLevel = 6;

                        //client.Player.SendUpdate(stream, client.Player.VipLevel, Game.MsgServer.MsgUpdate.DataType.VIPLevel);

                        //client.Player.UpdateVip(stream);

                        if (!client.Player.CanClaimFreeVip)
                        {
                            Database.VIPSystem.CheckUp(client);
                        }

                        Database.DataCore.LoadClient(client.Player);

                        client.Player.UID = client.ConnectionUID;

                        Database.DataCore.AtributeStatus.GetStatus(client.Player);
                        client.Player.Face = (ushort)(client.Player.Mesh < 1005? Program.GetRandom.Next(1, 49): Program.GetRandom.Next(201, 249));
                       // else
                           // client.Player.Face = (ushort)Program.GetRandom.Next(201, 250);

                        byte[] Hairstyles = new byte[] { 10, 11, 13, 14, 15, 24, 30, 35, 37, 38, 39, 40 };
                        byte Color = (byte)Program.GetRandom.Next(4, 8);

                        client.Player.Hair = (ushort)((Program.GetRandom.Next(3, 9) * 100) + Hairstyles[Program.GetRandom.Next(0, Hairstyles.Length)]);

                        //(ushort)(Color * 100 + 10 + (byte)Program.GetRandom.Next(4, 9));
                        client.Inventory.Add(stream, 720374, 1, 0, 0, 0, 0, 0, true);
                        client.Inventory.Add(stream, 723751, 1, 0, 0, 0, Role.Flags.Gem.NoSocket, Role.Flags.Gem.NoSocket, true);//leafBlade
                        if (client.Player.Class == 40)
                        {
                            client.Inventory.Add(stream, 723700, 1);
                            client.Inventory.Add(stream, 1050000, 10);
                        }
                        else if (client.Player.Class == 100)
                        {
                            if (!client.MySpells.ClientSpells.ContainsKey((ushort)Role.Flags.SpellID.Thunder))
                                client.MySpells.Add(stream, (ushort)Role.Flags.SpellID.Thunder);
                            if (!client.MySpells.ClientSpells.ContainsKey((ushort)Role.Flags.SpellID.Cure))
                                client.MySpells.Add(stream, (ushort)Role.Flags.SpellID.Cure);
                            if (!client.MySpells.ClientSpells.ContainsKey((ushort)Role.Flags.SpellID.Meditation))
                                client.MySpells.Add(stream, (ushort)Role.Flags.SpellID.Meditation);

                        }
                        else
                            client.Inventory.Add(stream, 410301, 1);
                        client.Equipment.Add(stream, 132005, Role.Flags.ConquerItem.Armor);
                        client.NewPlayer = true;
                        client.Send(new MsgServer.MsgMessage("ANSWER_OK", MsgMessage.MsgColor.red, MsgMessage.ChatMode.PopUP).GetArray(stream));
                        Database.ServerStats.LastChar = client.Player.Name;
                        client.Status.MaxHitpoints = client.CalculateHitPoint();
                        client.Player.HitPoints = (int)client.Status.MaxHitpoints;
                        client.ClientFlag |= Client.ServerFlag.CreateCharacterSucces;
                        if ((client.ClientFlag & Client.ServerFlag.CreateCharacterSucces) == Client.ServerFlag.CreateCharacterSucces)
                        {
                            if (Database.ServerDatabase.AllowCreate(client.ConnectionUID))
                            {
                                client.ClientFlag &= ~Client.ServerFlag.CreateCharacterSucces;
                                Database.ServerDatabase.CreateCharacte(client);
                                Database.ServerDatabase.SaveClient(client);
                                MsgTournaments.MsgSchedules.SendSysMesage("Welcome " + client.Player.Name + " to OrigensCO.", MsgServer.MsgMessage.ChatMode.Center, MsgServer.MsgMessage.MsgColor.white);
                                Console.WriteLine(client.Player.Name + " has created a new account IP [" + client.Socket.RemoteIp + "]");
                                Program.DiscordAPIfoundslog.Enqueue($"``NovoPlayer! {client.Player.Name}!``");
                                return;
                            }
                        }
                    }
                    else
                    {
                        client.Send(new MsgServer.MsgMessage("The name is in use! Try other name.", MsgMessage.MsgColor.red, MsgMessage.ChatMode.PopUP).GetArray(stream));
                    }
                }
                else
                {
                    client.Send(new MsgServer.MsgMessage("Invalid characters in name!", MsgMessage.MsgColor.red, MsgMessage.ChatMode.PopUP).GetArray(stream));
                }
            }
        }

        public static bool ExitBody(ushort _body)
        {
            return (_body == 1003 || _body == 1004 || _body == 2001 || _body == 2002);
        }

        public static bool ExitClass(byte cls)
        {
            return (cls == 10 || cls == 20 || cls == 40
                || cls == 50 || cls == 60 || cls == 70 || cls == 100 || cls == 80 || cls == 160);
        }
    }
}
