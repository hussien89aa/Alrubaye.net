using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace FLWebServicesC.Classes
{
    public class Encryptions
    {
        public string GetMD5Data(byte[] data)
        {
            // create new instance of md5
            MD5 md5a = MD5.Create();
            // convert the input text to array of bytes
            byte[] hashData = md5a.ComputeHash(data);
            // create new instance of StringBuilder to save hashed data
            StringBuilder returnValue = new StringBuilder();
            // loop for each byte and add it to StringBuilder
            for (int i = 0; (i
                        <= (hashData.Length - 1)); i++)
            {
                returnValue.Append(hashData[i].ToString("x2"));
            }
            //  return hexadecimal string
            return returnValue.ToString();
        }
    }
}