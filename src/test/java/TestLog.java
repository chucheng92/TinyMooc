import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by 哓哓 on 2015/11/30 0030.
 */

public class TestLog {
    public static void main(String[] args) {
        Logger log = LoggerFactory.getLogger(TestLog.class);
        log.error("**********Test*********");
    }
}
