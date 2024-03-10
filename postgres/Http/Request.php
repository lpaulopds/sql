<?php declare(strict_types=1);

namespace App\Http;

class Request
{
    private $httpMethod;

    private $uri;

    private $headers = [];

    private $postVars = [];

    public function __construct()
    {
        $this->httpMethod = $_SERVER['REQUEST_METHOD'] ?? '';
        $this->uri = $_SERVER['REQUEST_URI'] ?? '';
        // $this->setUri();
        $this->headers = getallheaders();
        $this->setPostVars();
    }

    public function getHttpMethod() {
        return $this->httpMethod;
    }

    public function getUri() {
        return $this->uri;
    }

    public function getHeaders() {
        return $this->headers;
    }

    public function setUri()
    {
        // // remove parametros da uri
        $remoParaURI = explode('?', $this->uri);
        $this->uri = $remoParaURI[0];
    }

    public function getPostVars() {
        return $this->postVars;
    }

    private function setPostVars()
    {
        if ($this->httpMethod == 'GET') return false;

        $this->postVars = $_POST ?? [];

        $inputRaw = file_get_contents('php://input');
        $this->postVars = (strlen($inputRaw)) && empty($_POST) ?
            json_decode($inputRaw, true) :
                $this->postVars;
    }
}
