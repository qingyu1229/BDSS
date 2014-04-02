package md5;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;
/**
 * Degist Util
 * @author Mr.rong
 *
 */
public class DegistUtil {
	/**
	 * produce encryption code
	 * @param seq
	 * @return
	 */
	public static String produceDegistCode(String seq) {
		try {
			MessageDigest md5Code=MessageDigest.getInstance("md5");
			BASE64Encoder base64=new BASE64Encoder();
			byte[] bTmp=md5Code.digest(seq.getBytes());
			base64.encode(bTmp);
			seq=base64.encode(bTmp);
			return seq;
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}
	public static void main(String[] args) {
		String pass="1发的发生的发的是31";
		System.out.println("MM:"+produceDegistCode(pass));
	}
}
