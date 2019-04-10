using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;

namespace CrimsonCoward
{
    public static class Helper
    {
        public static string GetString(this Guid[] ids)
        {
            string Str = string.Empty;
            if (ids != null)
            {
                foreach (Guid item in ids)
                {
                    Str = Str + item.ToString() + "|";
                }
            }

            return Str;
        }

        public static Guid[] GetGuids(this string idsStr)
        {
            string[] split = idsStr.Split('|');
            List<Guid> retVal = new List<Guid>();
            Guid item = Guid.Empty;
            foreach (string str in split)
            {
                item = str.ToGuid();
                if (item != Guid.Empty)
                {
                    retVal.Add(item);
                }
            }
            return retVal.ToArray<Guid>();
        }

        public static Guid ToGuid(this string str)
        {
            try
            {
                Guid retVal = new Guid(str);
                return retVal;
            }
            catch (Exception)
            {
                return Guid.Empty;
            }
        }

        public static int ToInt(this string str)
        {
            if (int.TryParse(str, out int retVal))
            {
                return retVal;
            }
            else
            {
                return 0;
            }
        }

        public static TimeSpan ToTimeSpan(this string timespanStr)
        {
            TimeSpan retVal;
            if (timespanStr.Contains(":"))
            {
                string[] all = timespanStr.Split(":".ToCharArray());
                if ((all != null) && (all.Length == 2))
                {
                    retVal = new TimeSpan(all[0].ToInt(), all[1].ToInt(), 0);
                }
                else
                {
                    retVal = new TimeSpan();
                }
            }
            else
            {
                retVal = new TimeSpan(timespanStr.ToInt(), 0, 0);
            }

            return retVal;
        }

        public static TimeSpan ToTimeSpan(this int minutes)
        {
            TimeSpan retVal = new TimeSpan(0, minutes, 0);
            return retVal;
        }

        public static double ToDouble(this string str)
        {
            double retVal = double.MinValue;
            if (double.TryParse(str, out retVal))
            {
                return retVal;
            }
            else
            {
                return 0.0;
            }
        }

        public static float ToFloat(this string str)
        {
            float retVal = float.MinValue;
            if (float.TryParse(str, out retVal))
            {
                return retVal;
            }
            else
            {
                return 0;
            }
        }

        public static DateTime ToDateTime(this string str)
        {
            DateTime retVal = DateTime.MinValue;
            if (DateTime.TryParse(str, out retVal))
            {
                return retVal;
            }
            else
            {
                return DateTime.MinValue;
            }
        }

        public static bool ToBool(this string str)
        {
            if (bool.TryParse(str, out bool retVal))
            {
                return retVal;
            }
            else
            {
                return false;
            };
        }

        public static T GetAttribute<T>(Enum en)
        {
            Type type = en.GetType();
            MemberInfo[] memInfo = type.GetMember(en.ToString());
            if (memInfo != null && memInfo.Length > 0)
            {
                object[] attrs = memInfo[0].GetCustomAttributes(typeof(T), false);
                if (attrs != null && attrs.Length > 0)
                {
                    return ((T)attrs[0]);
                }
            }
            return default(T);
        }
    }
}