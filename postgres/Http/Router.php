<?php declare(strict_types=1);

namespace App\Http;

class Router
{
    private $routes = [];

    /**
     * @var Request
     */
    private $request;

    public function __construct()
    {
        $this->request = new Request();
    }

    public function requestRouter() {
        return $this->request;
    }

    public function addRoute($method, $path, $callback) {
        if ($this->request->getQueryParams())
        {
            $path = $this->request->getUri();
            $this->routes[$method][$path] = $callback;
        }
        else {
            $this->routes[$method][$path] = $callback;
        }
        
    }

    public function dispatch($method, $path)
    {
        $arrMethod = array_key_exists($method, $this->routes);
        $arrPath = array_key_exists($path, $this->routes[$method]);

        if ($arrMethod && $arrPath)
        {
            $callback = $this->routes[$method][$path];
            !call_user_func($callback) ??
                throw new \Exception("Error Processing Callback", 406);
        }
        else {
            throw new \Exception("Erro 404: Rota não encontrada.", 404);
        }
    }
}
