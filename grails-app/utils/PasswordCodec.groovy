import java.security.MessageDigest
import sun.misc.BASE64Encoder
import sun.misc.CharacterEncoder
class PasswordCodec {

   static encode = { String s ->
	  MessageDigest md = MessageDigest.getInstance('SHA')
	  md.update s.getBytes('UTF-8')
      return (new BASE64Encoder()).encode(md.digest())
   }
}
