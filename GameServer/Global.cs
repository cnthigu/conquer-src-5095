using System;
using System.Collections.Generic;
using System.Text;

namespace COServer
{
    public class Global
    {
        public const double
        LUCKY_BLUE_MOUSE_RATE = 0,
        LUCKY_TIME_EXP_RATE = 0,
        LUCKY_TIME_PLUS_RATE = 0,
        LUCKY_TIME_BONUS_SOCKET_RATE = 0,//This is ADDED to the existing socket rate
        LUCKY_TIME_CRIT_RATE_RANGED = .9,//One in 20 monsters hit with lucky time will take double dmg
        LUCKY_TIME_CRIT_RATE_PHYSICAL = .15,//One in 20 monsters hit with lucky time will take double dmg
        LUCKY_TIME_CRIT_RATE_MAGIC = .7,//One in 20 monsters hit with lucky time will take double dmg
        LUCKY_TIME_CRIT_RATE_MONSTER = 5,
        MINING_DROP_GEMS = 0.2,            //porcentagem de gems normal.
        MINING_DROP_GEMS_REFIND = 0.05,     //porcentagem de gems refine
        MINING_DROP_GEMS_SUPER = 0.01,     //porcentagem de gems. super       
        MINING_DROP_DRAGONBALL = 0;        //Drop de Dragonball na mina.
    }
}
