package teamproject.ssja.exception;

public class UnMatchedPasswordException extends RuntimeException {
    public UnMatchedPasswordException(String message) {
        super(message);
    }
}