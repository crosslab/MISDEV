package labs.common.security;

import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;
/**
 * properties配置文件支持加密。
 * 使用方法：在密文前加   encryped:
 * 比如 password=encryped:5a0eec0a3a113dd99640165479112
 * 不需要加密的项，不需要加encryped:
 * @author labs
 *
 */
public class EncryptPropertyPlaceholderConfigurer extends PropertyPlaceholderConfigurer {

	private final String PREPEND = "encryped:";

	protected String convertPropertyValue(String originalValue) {
		if (originalValue != null && originalValue.indexOf(PREPEND) > -1) {
			String encryped = originalValue.substring(PREPEND.length());
			String v = Cryptos.aesDecrypt(encryped);
			return super.convertPropertyValue(v);
		}
		return super.convertPropertyValue(originalValue);
	}
}