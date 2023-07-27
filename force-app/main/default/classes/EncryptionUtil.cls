public class EncryptionUtil {

    private static Blob key = Crypto.generateAesKey(128);

    public static String encrypt(String clearText) {
        Blob encryptedData = Crypto.encryptWithManagedIV('AES128', key, Blob.valueOf(clearText));
        return EncodingUtil.base64Encode(encryptedData);
    }

    public static String decrypt(String encryptedText) {
        Blob encryptedData = EncodingUtil.base64Decode(encryptedText);
        Blob decryptedData = Crypto.decryptWithManagedIV('AES128', key, encryptedData);
        return decryptedData.toString();
    }
}