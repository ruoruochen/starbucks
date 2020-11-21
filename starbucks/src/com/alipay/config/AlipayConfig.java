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
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDCw0G5eMhbm/TIvdDpES5Rwe2PuVefZFjbN9ZzaM6Ec5P+wFiSd0tVBn+Ixf6vBCPp/PSh0cEWdn2l0ynvTtJOWk/B3PoSaCxF7AThayH1YAcvCN9QH2rzbx2SoYg+LW0bOEKs6soltVwvyDP59ajy0cYKbHCpyzIXuQ2yQOBTcRcacQso27nAVtQ4aM96KinR5J21j3jkt+X0g5/7d5hsXtqUqReh0q6fgoAmQB3bMhYwa1CTxzsCECmE7Knwpo/CmKtJi2V3aPCffhvXEpMXr7SAjSN6SPKhCmcew+qu2GOZJiFC2KYfcfSI8TYxKUIqFfp+55QaTrSYLuXSTXKXAgMBAAECggEAK2o9L2wGNa2ZLlppxFqJGb6CB0TIjIZg7FURH97gElR1TBdyZwvipgxxx3pjYH4qx1EU8zF/ulMlhR6CPY8zgDXPi6aHtCy2mcuX9uvbwQfr8gcnSIQIYkWFsRcC+OFFbgjnjAY2k5tO9nPJalHhnGc4n0A3CRJ7kyA0NmUR3Gd4WUclRlBg+ODm6CqWNnCoXf5rn5fQJGhoI78ZYhnjJBWx/mlqauzSxPokp5BwPFa5snAxd133eShhwDMKKVN1WwVYyGzQM0bxLgsOp20HqBDs/P8jk6ayb65OZTEAC+vmNiIXIMyTVqSFbvtp1o/ggPNFY0MZ5RPHzLsPtY41cQKBgQDy1XoVQ8FuRLQv4fARce74QDuYlevohKuBxZU7sgqM5itQywQhch1Zyy24SEbDxUjdeW6KqelhZjCkyhKV0iyBhivhvKG2TMCjZ2Ujy6+/5qLxGpZsU+TDjSHqyd0Uc/HWqD8ULAvNKL4qepIIOM41AM8wpXb1cjZ5wiMonCqsSQKBgQDNUo3hWXJqTVus/j/+qHxC9VZZ4l6LM6/bo1FYKDbbuIOVfdAx6vWqT/Ft46riqs70CZzDib4wHrSoYUIXaDRe1eIKRL2nhlro/Du5JPVRy/thCmJMoO2Q8IhnPgJYL3DyyWY/zckB6YJ1no6wU9VCPiaghQ5T9/Rlg6cuj1Bn3wKBgQCAMSwKr8McWA6bPHYEb5YM3bPYYESycd8sWcbnRZ0GNrflJddfZKOT9IuFPjqFPM+zg1hUwU/fyBej1r0q9FHkapUdzPu9hhUn7fxZgjycXL/l8fg45azdgtLF5JzeIDsp65WpK3trabfCKwSObJaHKo82ChObjRiu/EqdNJveaQKBgHdW4Hh20PXQeNSYAwI1U+RnTQV5eZJXPIPg7UrcNOaI3JJrSjN5acjQJnfEuHJ+7UMSwzc0PIMjlcW4of2Q57+neXaWddWFVhnNYbk/LgeZFEdXDcOUVgDEjcPUWvB+wpubS/8R0R93ZgiPXEhIsc+K6FCshaNwn3DRkL6TNhzpAoGAWSpjxn4Pb6Fpb7a0GEDpMVImlS6X6NZeRyvDmHbOuUD8qBLrNaASf1vvv+NFGofJDbw/Paa79SI03y4lgCGl/REpgxwklWjNWzNVHDBwZM9KtIeh7yvN0tdJu7Z9d01lWfua0dCBkQ+gJJ0AgYbChEfu8L8UIc9xrBStp6qCGj0=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApDj7HsQJnXejnd8BrNxvcQUnsWvEOAK9FtVySPOqbWfS2ELUaKuvJ+Vs5vKQS8kErEbHA9xoE7Jclb7DpeWPAIgdIUEfpu6ai9+NTsxrjsYKRuTqt0LJZ8qhHpFaK0ZIzXib1kaDsS8DEe/EU8hzlJeDsD2MZk6Ea5M6zUnRZ8PvAc18M7PhUxO3QQMNpI3/GTwAgSBAL7V9W5Xb55DfCqEjTYkXvKYo2KPq6ZRJOga8nVC4hcwAtefNXvOQoKnHCPFaAdvNhyC12T7DphUQtm+G1laQ2a1LPlNtn+8wQyIgcKLeOXWROh8hdYMXjssdc0F9AL+CBF7JbV+LzjpXqwIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/return_url.jsp";

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

