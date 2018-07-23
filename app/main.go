package main

import "github.com/gin-gonic/gin"
import "os"
import "fmt"

func main() {
	r := gin.Default()
	r.GET("/hello-world", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "Hello World",
		})

	})

	port := os.Getenv("APP_PORT")
	if port == "" {
		port = "8080"
	}

	fmt.Printf("\n\nRunning the app using port: %s\n", port)

	r.Run(fmt.Sprintf("%s%s", ":", port))
}
