using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using COServer.Game.MsgServer;
using COServer.Game.MsgTournaments;

namespace COServer.Game.MsgMonster
{
    public class BossesBase
    {
        internal static void SendInvitation(string Name, ushort X, ushort Y, ushort map, ushort DinamicID, int Seconds, Game.MsgServer.MsgStaticMessage.Messages messaj = Game.MsgServer.MsgStaticMessage.Messages.None)
        {
            string Message = " " + Name + " is about to begin! Will you join it?";
            using (var rec = new ServerSockets.RecycledPacket())
            {
                var stream = rec.GetStream();
                Program.SendGlobalPackets.Enqueue(new MsgMessage($"{Name} has started!", MsgMessage.MsgColor.yellow, MsgMessage.ChatMode.TopLeftSystem).GetArray(rec.GetStream()));

                var packet = new Game.MsgServer.MsgMessage(Message, MsgServer.MsgMessage.MsgColor.yellow, MsgServer.MsgMessage.ChatMode.Center).GetArray(stream);
                foreach (var client in Database.Server.GamePoll.Values)
                {
                    client.Send(packet);
                    client.Player.MessageBox(Message, new Action<Client.GameClient>(user => user.Teleport(X, Y, map, DinamicID)), null, Seconds, messaj);
                }
            }

            // Envia uma mensagem para o Discord informando que o evento começou
            Program.DiscordAPIevents.Enqueue($"``{Name} has started!``");
            Program.DiscordAPI.Enqueue($"`` Server Online ``");
        }



        public static DateTime lastCleanwaterSpawnTime = DateTime.Now; // Armazena o último spawn do Cleanwater      
        public static DateTime lastSpawnTime = DateTime.Now; // Armazena o último spawn dos outros bosses
        public static DateTime lastSnakeKingSpawnTime = DateTime.Now; // Armazena o último spawn do Sna
        public static DateTime lastGanodermaSpawnTime = DateTime.Now;
        public static DateTime lastTitanSpawnTime = DateTime.Now;

        public static void BossesTimer()
        {
            DateTime now = DateTime.Now;

            // TeratoDragon: Spawna toda virada de hora (xx:35)
            if (now.Minute == 35 && now.Second == 0)
            {
                Random R = new Random();
                int Nr = R.Next(1, 6); // Sorteio de local, agora com 6 opções

                if (Nr == 1)
                {
                    SpawnHandler(1002, 564, 792, 20060, "TeratoDragon",
                        "will appear at " + now.Hour + ":00! Get ready to fight! You only have 5 minutes!",
                        " has spawned in " + Database.Server.MapName[1002] + " (564,792)!",
                        MsgServer.MsgStaticMessage.Messages.TeratoDragon);
                    SendInvitation("TeratoDragon", 564, 792, 1002, 0, 60, MsgServer.MsgStaticMessage.Messages.TeratoDragon);
                    Program.DiscordAPIevents.Enqueue("```TeratoDragon Spawned in TwinCity(564, 792)!```");
                }
                else if (Nr == 2)
                {
                    SpawnHandler(1000, 293, 459, 20060, "TeratoDragon",
                        "will appear at " + now.Hour + ":00! Get ready to fight! You only have 5 minutes!",
                        " has spawned in " + Database.Server.MapName[1000] + " (293,459)!",
                        MsgServer.MsgStaticMessage.Messages.TeratoDragon);
                    SendInvitation("TeratoDragon", 293, 459, 1000, 0, 60, MsgServer.MsgStaticMessage.Messages.TeratoDragon);
                    Program.DiscordAPIevents.Enqueue("```TeratoDragon Spawned in DesertIsland(293, 459)!```");
                }
                else if (Nr == 3)
                {
                    SpawnHandler(1020, 568, 584, 20060, "TeratoDragon",
                        "will appear at " + now.Hour + ":00! Get ready to fight! You only have 5 minutes!",
                        " has spawned in " + Database.Server.MapName[1012] + " (568,584)!",
                        MsgServer.MsgStaticMessage.Messages.TeratoDragon);
                    SendInvitation("TeratoDragon", 568, 584, 1020, 0, 60, MsgServer.MsgStaticMessage.Messages.TeratoDragon);
                    Program.DiscordAPIevents.Enqueue("```TeratoDragon Spawned in Ape Island(568, 584)!```");
                }
                else if (Nr == 4)
                {
                    SpawnHandler(1015, 811, 536, 20060, "TeratoDragon",
                        "will appear at " + now.Hour + ":00! Get ready to fight! You only have 5 minutes!",
                        " has spawned in " + Database.Server.MapName[1105] + " (811,536)!",
                        MsgServer.MsgStaticMessage.Messages.TeratoDragon);
                    SendInvitation("TeratoDragon", 811, 536, 1015, 0, 60, MsgServer.MsgStaticMessage.Messages.TeratoDragon);
                    Program.DiscordAPIevents.Enqueue("```TeratoDragon Spawned in Bird Island(811, 536)!```");
                }
                else if (Nr == 5)
                {
                    SpawnHandler(1787, 48, 38, 20070, "Dragon",
                        "will appear at " + now.Hour + ":00! Get ready to fight! You only have 5 minutes left!",
                        " has spawned in Dragon Island!");
                    SendInvitation("DragonIsland", 48, 38, 1787, 0, 60, MsgServer.MsgStaticMessage.Messages.TeratoDragon);
                    Program.DiscordAPIevents.Enqueue("```Dragon Spawned in DragonIsland(48, 38)!```");
                }
            }
            // Ganoderma: Spawna às XX:15 de toda hora
            if (now.Minute == 15 && now.Second == 0)
            {
                var map = Database.Server.ServerMaps[1011];
                if (!map.ContainMobID(3130))
                {
                    SpawnHandler(1011, 655, 799, 3130, "Ganoderma",
                        "A Ganoderma has spawned...",
                        " has spawned...");
                    lastGanodermaSpawnTime = now;
                    Program.DiscordAPIevents.Enqueue("```Ganoderma Spawned (655),(799)...```");
                }
            }
            // Titan: Spawna às XX:21 de toda hora
            if (now.Minute == 21 && now.Second == 0)
            {
                var map = Database.Server.ServerMaps[1020];
                if (!map.ContainMobID(3134))
                {
                    SpawnHandler(1020, 417, 625, 3134, "Titan",
                        "A Titan has spawned...",
                        " has spawned...");
                    lastTitanSpawnTime = now;
                    Program.DiscordAPIevents.Enqueue("```Titan Spawned (417),(625)...```");
                }
            }
            // Cleanwater: Spawna a cada 30 minutos (xx:00 e xx:30)
            if (now.Minute % 30 == 0 && now.Second == 0)
            {
                SpawnHandler(1212, 428, 418, 8500, "Cleanwater",
                    "Cleanwater has spawned in " + Database.Server.MapName[1212] + " (428, 418)! Get ready to fight!",
                    " has spawned in " + Database.Server.MapName[1212] + " (428, 418)!");
                Program.DiscordAPIevents.Enqueue("```Cleanwater Spawned (428, 418)!```");
            }
            // SnakeKing: Spawna toda virada de hora (xx:40)
            if (now.Minute == 40 && now.Second == 0 && (now - lastSnakeKingSpawnTime).TotalMinutes >= 60)
            {
                SpawnHandler(1063, 84, 64, 3102, "SnakeKing",
                    "SnakeKing has spawned in " + Database.Server.MapName[1063] + " (84, 64)! Get ready to fight!",
                    " has spawned in " + Database.Server.MapName[1063] + " (84, 64)!");

                lastSnakeKingSpawnTime = now; // Atualiza o tempo do último spawn
                Program.DiscordAPIevents.Enqueue("```SnakeKing Spawned (84, 64)!```");
            }
        }

        public static void SpawnHandler(uint MapID, ushort X, ushort Y, uint MobID, string MonsterName, string PrepareMsg, string Msg, MsgServer.MsgStaticMessage.Messages idmsg = MsgServer.MsgStaticMessage.Messages.None)
        {
            var Map = Database.Server.ServerMaps[MapID];
            if (!Map.ContainMobID(MobID))
            {
                using (var rec = new ServerSockets.RecycledPacket())
                {
                    var stream = rec.GetStream();
                    Program.SendGlobalPackets.Enqueue(new MsgServer.MsgMessage(MonsterName + Msg, "ALLUSERS", "Server", MsgServer.MsgMessage.MsgColor.white, MsgServer.MsgMessage.ChatMode.Center).GetArray(stream));
                    Database.Server.AddMapMonster(stream, Map, MobID, X, Y, 1, 1, 1);
                }
            }
        }
    }
}
