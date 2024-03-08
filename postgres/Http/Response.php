<?php declare(strict_types=1);

namespace App\Http;

class Response
{
    /**
     * @var integer
     */
    private $httpCode = 200;

    /**
     * @var array
     */
    private $headers = [];

    /**
     * @var string
     */
    private $contentType;

    /**
     * @var mixed
     */
    private $content;

    public function __construct($httpCode, $content, $contentType = 'text/html')
    {
        $this->httpCode = $httpCode;
        $this->content = $content;
        $this->setContentType($contentType);
    }

    public function setContentType($contentType)
    {
        $this->contentType = $contentType;
        $this->addHeaders('Content-Type', $contentType);
    }

    public function addHeaders($key, $value) {
        $this->headers[$key] = $value;
    }

    private function sendHeaders()
    {
        http_response_code($this->httpCode);

        foreach ($this->headers as $key => $value) {
            header($key.': '.$value);
        }
    }

    public function sendResponse()
    {
        $this->sendHeaders();
        switch ($this->contentType) {
            case 'text/html':
                echo $this->content;
                exit;
        }
    }
}
