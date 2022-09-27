package main

import (
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/spf13/viper"
)

type Config struct {
	// Go Env URL
	GoEnv string `mapstructure:"GO_ENV"`
}

func main() {
	var config Config
	viper.AutomaticEnv()
	viper.AddConfigPath("./")
	viper.SetConfigFile(".env")
	err := viper.ReadInConfig()
	if err != nil {
		fmt.Println(err)
	}
	err = viper.Unmarshal(&config)
	if err != nil {
		fmt.Println(err)
	}
	fmt.Println(config.GoEnv)
	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "pong",
			"env":     config.GoEnv,
		})
	})
	r.Run()
}
