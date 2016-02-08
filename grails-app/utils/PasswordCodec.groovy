import java.security.MessageDigest
import org.apache.commons.codec.binary.Base64
class PasswordCodec {

   static encode = { String s ->
	  MessageDigest md = MessageDigest.getInstance('SHA')
	  md.update s.getBytes('UTF-8')
      return (new BASE64Encoder()).encode(md.digest())
   }
}
