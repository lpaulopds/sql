<?php declare(strict_types=1);

namespace App\Http;

class Request
{
    private $httpMethod;

    private $uri;

    private $headers = [];

    public function __construct()
    {
        $this->httpMethod = $_SERVER['REQUEST_METHOD'] ?? '';
        $this->uri = $_SERVER['REQUEST_URI'] ?? '';
        // $this->setUri();
        $this->headers = getallheaders();
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
}
