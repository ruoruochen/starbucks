package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016110200786652";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDFFB0MKL4MKEsGQjwNcQtl8C2LeIr6EMt9v+E5ci0tVZ0/q3xgib/6fxWZJqxtbGpLzdps91+XKg8LCNQj68vpdSN1WoWYr+U1oh5YAbLjj2RpYMhsagtNpHa+UY9hnExebO/s+MhjPFKv8NEH5LRh/PcEE9+xjrMrgSJ42NHUSE+xKd46LMqOo3SyDNy8dNxvbBDuzUhCoFmc3xPyznYDasvP+m23Kq7m9hVGpYnVYX7SLfoNVAEr5aTVtag3GT/TP6uhs4+7CUXXMd2R3+kFCJC7aFuWx/PsBogNTj0OrRMjTRSBh9Yf9FIBZ9sa4iZ8C6l0ziXod4eHDKpvYfyrAgMBAAECggEBAKzSsZJbHCXPI9OOO9lRu7wd/eKjx8P4/Gn+3UQiIwnxXR9bg4uo4KiLz2XpayXd/+0PzS7nU3VdVanIiTgi7EODDKA5zJQUE72PuGpWuwghU92xGLEx4U2qHtNQ9JqVlMbtYwz9McUMPjq5xKTWY3TWf8ucnfq399j7uj4dbQxo/zIfs18itWpqDfhFNJ3jnvRDf0MbLdK+4bUSHLpp31HjBwdHwqqQKw35C6P4vYoVBzpTxg34alD1YQnHfEXjFI9aXGINLKRYiuz4GxYQtD/vsIZY2qDXhvnSdxX7SdHa0vhJiZLEV71Pk5rbfpj6XPSvar/yxkuTNgMyjzG5xjECgYEA5DpdUUCB+R/LYnitgWGjcuOR4Nns0C3seCYie7dp9slUm+tGMag4Y+V1hXjLxKjYciCJ74E2VtDRQZOs8Hp785N6l9enxbMMtJ3ibsl7rt2jDwzMiPzHFHCXkoO8TIjv7RMsEDOVzyUvOQCvY9b/vaLqBsFGkjul6K1U7e9eG7MCgYEA3Q9mJndm3i95LU0T++6GiePul1dbanSDnFBIUT53yAbNJxzCaKeT8hPCqsRCM6qqCH8LAyiY+vhgIFIXBCRMZQk4qo5hjS+ad2PxgtOwWOwTx33YLh+aqaPYr2n1uC2FSV0hWf0Ek+IitAcwHTHW+I1QxA3qlrBstj9p/vxHvykCgYArQViQXr6DfeApQJ/5xoyY6MKsMAFvD1UjDG86rW9643uStYuvO6e8Xy/f5R4RnsKvFrWt2/p1h8wxNpDvXveBGbGBd9EHakD9NnNE9hDn+n++CXn2eJouqIxBq5ATnVyDvT97rps1EGIb1qJnNMdxpJ/gOd9rNbzjFX7kPZrDewKBgQCDfRNfsgoIAujrHzvR0LFJ98AFWTrQ+XkHU2GQob2RxynkJ+Ejavo/Na3G8XIHVW5KG3cra8yDC5Xx46I5HnYqau+/020HE9enSFVxYgU0/0dMk/gwhy/x07mhrT8xTDJJzxF1e2BrrkjCGLxvwSODOFtgIn71Hv+q79FWkC0E8QKBgD+k0V6MxHqkHIT9jHmcaM18MY6uY4bffJUTEmesUEumnHscCgYL3v3Po2zplVU4MtiZ11cZv3jS/k/9xxEtm17q1CrXLQ+puFUBygS0at6toYWBiD19eDL9wgzJnKqXqKG1UQLCanVO9q2eRLEY6cRO6A62CvjpiOT0Ev3jeUp+";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApDj7HsQJnXejnd8BrNxvcQUnsWvEOAK9FtVySPOqbWfS2ELUaKuvJ+Vs5vKQS8kErEbHA9xoE7Jclb7DpeWPAIgdIUEfpu6ai9+NTsxrjsYKRuTqt0LJZ8qhHpFaK0ZIzXib1kaDsS8DEe/EU8hzlJeDsD2MZk6Ea5M6zUnRZ8PvAc18M7PhUxO3QQMNpI3/GTwAgSBAL7V9W5Xb55DfCqEjTYkXvKYo2KPq6ZRJOga8nVC4hcwAtefNXvOQoKnHCPFaAdvNhyC12T7DphUQtm+G1laQ2a1LPlNtn+8wQyIgcKLeOXWROh8hdYMXjssdc0F9AL+CBF7JbV+LzjpXqwIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/starbucks/consumer/order.jsp";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

