using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace COServer.Game.MsgTournaments
{
    public class LastMan
    {
        public const uint Map = 1844;
        private ProcesType Mode;
        private DateTime FinishTimer = new DateTime();
        private string Title = "LastMan";
        public uint WinnerUID = 0;

        public LastMan()
        {
            Mode = ProcesType.Dead;
            if (!Program.OutMap.Contains(Map))
                Program.OutMap.Add(Map);
            if (!Program.FreePkMap.Contains(Map))
                Program.FreePkMap.Add(Map);
        }

        public void Open()
        {
            if (Mode == ProcesType.Dead)
            {
                FinishTimer = DateTime.Now.AddMinutes(1);
                Mode = ProcesType.Alive;
                MsgSchedules.SendInvitation("LastMan", 436, 353, 1002, 0, 60, Game.MsgServer.MsgStaticMessage.Messages.LastMan);
                MsgSchedules.SendSysMesage("" + Title + " has started!", MsgServer.MsgMessage.ChatMode.Center, MsgServer.MsgMessage.MsgColor.red);
            }
        }

        public void CheckUp()
        {
            if (Mode == ProcesType.Alive)
            {
                if (DateTime.Now > FinishTimer)
                {
                    Mode = ProcesType.Dead;
                }
            }
            if (DateTime.Now.Minute == 50 && DateTime.Now.Second < 2)
            {
                if (Mode == ProcesType.Dead)
                {
                    FinishTimer = DateTime.Now.AddMinutes(1);
                    Mode = ProcesType.Alive;
                    MsgSchedules.SendInvitation("LastMan", 436, 353, 1002, 0, 60, Game.MsgServer.MsgStaticMessage.Messages.LastMan);
                    MsgSchedules.SendSysMesage("" + Title + " has started!", MsgServer.MsgMessage.ChatMode.Center, MsgServer.MsgMessage.MsgColor.red);
                }
            }
        }

        public bool AllowJoin(Client.GameClient user, ServerSockets.Packet stream)
        {
            if (Mode == ProcesType.Alive)
            {
                ushort x = 0;
                ushort y = 0;
                Database.Server.ServerMaps[Map].GetRandCoord(ref x, ref y);
                user.Teleport(x, y, Map);
                return true;
            }
            return false;
        }

        public bool IsFinished() { return Mode == ProcesType.Dead; }

        public bool TheLastPlayer()
        {
            return Database.Server.GamePoll.Values.Where(p => p.Player.Map == Map && p.Player.Alive).Count() == 1;
        }

        public void GiveReward(Client.GameClient client, ServerSockets.Packet stream)
        {
            WinnerUID = client.Player.UID;

            // Lista de itens e suas respectivas mensagens de anúncio
            var rewards = new (uint ItemID, string ItemName)[]
            {
                    (1088001, "Meteor"),
                    (720027, "MeteorScroll"),
                    (730001, "+1Stone"),
                    (1088000, "DragonBall"),
            
            };

            // Gerador de números aleatórios para escolher o item
            Random random = new Random();
            var selectedReward = rewards[random.Next(rewards.Length)];

            // Enviar mensagens ao jogador e ao sistema
            client.SendSysMesage($"You received a {selectedReward.ItemName}.", MsgServer.MsgMessage.ChatMode.System, MsgServer.MsgMessage.MsgColor.red);
            MsgSchedules.SendSysMesage($"{client.Player.Name} has won {Title} and received a {selectedReward.ItemName}!", MsgServer.MsgMessage.ChatMode.TopLeftSystem, MsgServer.MsgMessage.MsgColor.white);

            // Anunciar no Discord
            Program.DiscordAPIwinners.Enqueue($"``[{client.Player.Name}] Won {Title} and received a {selectedReward.ItemName}.``");

            // Adicionar o item ao inventário
            client.Inventory.Add(stream, selectedReward.ItemID, 1, 0, 0, 0, 0, 0, false);

            // Restaurar a vida do jogador e teleportar
            client.Player.HitPoints = (int)client.Status.MaxHitpoints;
            client.Teleport(438, 387, 1002);
        }

        public void AddTop(Client.GameClient client)
        {
            if (WinnerUID == client.Player.UID)
                client.EffectStatus.Add("toplast", DateTime.Now.AddHours(12));
            foreach (var user in Database.Server.GamePoll.Values)
            {
                if (user.Player.UID != WinnerUID)
                    client.EffectStatus.Remove("toplast");
            }
        }
    }
}
