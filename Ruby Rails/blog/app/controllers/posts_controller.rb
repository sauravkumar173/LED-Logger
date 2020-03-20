class PostsController < ApplicationController
    # Authenticity token used to stop dangerous http requests
    skip_before_action :verify_authenticity_token

    # Gets all posts in order they were last updated
    def index
        @post = Post.order(updated_at: :desc)
    end

    # Method to get newest post
    def new
        @post = Post.new
    end

    # Creates a new post and ensures it is valid
    def create
        @post = Post.new(post_params)

        if @post.valid? && @post.save
            redirect_to posts_path
        else
            render :new
        end
    end

    # Retrieves post with a particular id
    def show
        @post = Post.find(params[:id])
    
    end

    # Retrieves post with a particular id to be edited
    def edit
        @post = Post.find(params[:id])
    
    end

    #updates a specific post's title and contents
    def update
        #retrieves post and updates the parameters
        @post = Post.find(params[:id])
        @post.update!(post_params)

        #ensures post is still valid
        if @post.valid? && @post.save
            redirect_to posts_path
        else
            render :edit
        end

    end

    #deletes a post based on id
    def destroy
        Post.destroy(params[:id])
        redirect_to posts_path
    end

    #send GET request to ESP8266 and updates flash alert
    def ledOn
        #sends a GET request to the ESP8266 route dedicated to turning on the LED
        @response = HTTParty.get("http://192.168.20.41/LED/on/")
        puts @response

        #updates the flash alert if the JSON received says the LED is on
        if @response["Rec"] == "LEDon"
            flash.alert = "LED is turned on"
        end

        redirect_to posts_path

    end

    #send GET request to ESP8266 and updates flash alert
    def ledOff
        #sends a GET request to the ESP8266 route dedicated to turning off the LED
        @response = HTTParty.get("http://192.168.20.41/LED/off/")
        puts @response

        #updates the flash alert if the JSON received says the LED is off
        if @response["Rec"] == "LEDoff"
            flash.alert = "LED is turned off"
        end

        redirect_to posts_path
    end

    private
    #private function to retrieve post parameters including title and contents
    def post_params
        params.require(:post).permit(:title, :content)
    end



end
