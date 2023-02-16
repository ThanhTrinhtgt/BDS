<?php
namespace BDS\Core;

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

/**
 * 
 */
class SMTPMail extends \stdClass
{
    private $username = 'thanhtrinh.website.544@gmail.com';
    private $password = 'titzcibbedioogxq'; //setup tại https://myaccount.google.com/apppasswords

    function __construct()
    {
        // code...
    }

    public function send($body = '', $altbody = '')
    {

        $mail = new PHPMailer();

        $mail->isSMTP();

        //Enable SMTP debugging
        //SMTP::DEBUG_OFF = off (for production use)
        //SMTP::DEBUG_CLIENT = client messages
        //SMTP::DEBUG_SERVER = client and server messages
        //$mail->SMTPDebug = SMTP::DEBUG_SERVER;

        //Set the hostname of the mail server
        $mail->Host = 'smtp.gmail.com';

        //Set the SMTP port number:
        // - 465 for SMTP with implicit TLS, a.k.a. RFC8314 SMTPS or
        // - 587 for SMTP+STARTTLS
        $mail->Port = 465;

        //Set the encryption mechanism to use:
        // - SMTPS (implicit TLS on port 465) or
        // - STARTTLS (explicit TLS on port 587)
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;

        $mail->SMTPAuth = true;
        $mail->Username = $this->username;
        $mail->Password = $this->password;

        $mail->setFrom('thanhtrinh.website.544@gmail.com', 'First Last');
        //$mail->addReplyTo('replyto@example.com', 'First Last');

        $mail->addAddress('thanhtrinh.tgt@gmail.com', 'John Doe');

        $mail->Subject = 'Cảnh báo từ website';
        $mail->Body    = !empty($body) ? $body : 'Mail cảnh báo từ hệ thống, nhưng chưa có nội dung thông báo cụ thể! hãy kiểm tra ngay';
        $mail->AltBody = !empty($altbody) ? $altbody : 'Đây là cảnh báo từ hệ thống nhưng chưa có nội dung cụ thể';

        //Attach an image file
        //$mail->addAttachment('images/phpmailer_mini.png');

        if (!$mail->send()) {
            echo 'Mailer Error: ' . $mail->ErrorInfo;
        } else {
            echo 'Message sent!';
            //Section 2: IMAP
            //Uncomment these to save your message in the 'Sent Mail' folder.
            #if (save_mail($mail)) {
            #    echo "Message saved!";
            #}
        }

    }
}