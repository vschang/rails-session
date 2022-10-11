// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import ChatroomSubscriptionController from "./chatroom_subscription_controller"
application.register("chatroom-subscription", ChatroomSubscriptionController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import SearchMusicController from "./search_music_controller"
application.register("search-music", SearchMusicController)

import SpotifyCardController from "./spotify_card_controller"
application.register("spotify-card", SpotifyCardController)
