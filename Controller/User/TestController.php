<?php 
namespace BDS\Controller\User;

use BDS\Controller\User\BaseController;
use BDS\Core\SimpleXLSX;
use BDS\Core\Helper;
use Orhanerday\OpenAi\OpenAi;

class TestController extends BaseController
{
	const API_KEY = "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";
	const TOKEN_BOT_VIPPRO 		= '5286304355:AAF0l3zJiaqllH2qIu5WvCggC4qdJ4-IUNc';
	const ID_THANHTRINH    		= '632356941';
	const api_link 				= 'https://api.telegram.org/bot';

	public function index()
	{
		$request = json_decode(file_get_contents('php://input'), true);
		
		$message   = $request['message'];
		$chat      = $message['chat'];
		$mess      = $message['text'];
		$from      = $message['from'];
		$chatId    = $chat['id'];
		$chatType  = $chat['type'];
		$entities  = ($chatType == 'supergroup' && !empty($message['entities'])) || $chatType == 'private' ? true : false;

		/*$content = file_get_contents('php://input')." $entities \n";
				$filename = 'thanh.txt';
				file_put_contents($filename, $content, FILE_APPEND);
				chmod($filename, 0664);*/

		if ($entities) {
			$curl = curl_init();    // create cURL session

			$apikey = self::API_KEY; // login to https://beta.openai.com/account/api-keys and create an API KEY

			$url = "https://api.openai.com/v1/completions";
			curl_setopt($curl, CURLOPT_URL, $url);
			curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
			curl_setopt($curl, CURLOPT_POST, true);

			$headers = array( // cUrl headers (-H)
			    "Content-Type: application/json",
			    "Authorization: Bearer $apikey"
			);

			curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);

			$mess = !empty($mess) ? $mess : 'Xin chào';

			$data = array( // cUrl data
			    "model" => 'text-davinci-003', // gpt-3.5-turbo     text-davinci-003
			    //"messages" => ["role" => "user", "content" => $mess],
			    "prompt" => $mess, // choose your prompt (what you ask the AI)
			    "temperature" => 0.7,   // temperature = creativity (higher value => greater creativity in your promts)
			    "max_tokens" => 1000     // max amount of tokens to use per request
			);

			curl_setopt($curl, CURLOPT_POSTFIELDS, json_encode($data));

			$response = curl_exec($curl);   
			
			$response = json_decode($response, true);   // extract json from response

			$generated_text = $response['choices'][0]['text'];  // extract first response from json

			echo $generated_text;   // output response

		
			if ($this->sendTelegram($generated_text, $chatId)) {
				/*$content = "send thanh cong \n";
				$filename = 'thanh.txt';
				file_put_contents($filename, $content, FILE_APPEND);
				chmod($filename, 0664);*/
			}

			curl_close($curl);      // close cURL session
		}
	}

	public function sendTelegram($mess, $chatId)
	{
		$url = self::api_link . self::TOKEN_BOT_VIPPRO . "/sendMessage";

	    $data = array(
	    	'parse_mode' => 'HTML',
	    	'chat_id'    => !empty($chatId) ? $chatId : self::ID_THANHTRINH,
	    	'text'		 => $mess
	    );

	    $ch = curl_init();

	    $optArray = array(
            CURLOPT_URL => $url,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_HTTPHEADER => array(
            	'Contet-Type: application/x-ww-form-urlencoded'),
            CURLOPT_POSTFIELDS => http_build_query($data)
	    );

	    curl_setopt_array($ch, $optArray);
	    $result = curl_exec($ch);
	    curl_close($ch);

	    return true;
	}
}