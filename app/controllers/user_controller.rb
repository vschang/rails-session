class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_id_arr = []
    @user_id = @user.id
    @user_id_arr << @user_id

    @friendship = Friendship.new

    @user_posts = Post.where(user_id: @user_id)
    @user_reposts = Repost.where(user_id: @user_id)

    @profile_posts = @user_posts + @user_reposts
    @profile_posts = @profile_posts.sort_by{ |posts| posts.created_at }.reverse

    @post_time = []
    time_now = Time.now
    @profile_posts.each do |post|
      time_diff = time_now - post.created_at
      puts time_diff
      if time_diff < 3600.0
        puts "less than 3600.0"
        x = (time_diff/1.minute).to_i.round
        if x >= 1.5
          @post_time << "#{(time_diff/1.minute).to_i.round} minutes"
          puts "pushed to post time"
        else
          @post_time << "#{(time_diff/1.minute).to_i.round} minute"
        end
      elsif time_diff > 3600.0 && time_diff < 86400.0
        x = (time_diff/1.hour).to_i.round
        if x >= 1.5
          @post_time << "#{(time_diff/1.hour).to_i.round} hours"
        else
          @post_time << "#{(time_diff/1.hour).to_i.round} hour"
        end
      else
        x = (time_diff/1.day).to_i.round
        if x >= 1.5
          @post_time << "#{(time_diff/1.day).to_i.round} days"
        else
          @post_time << "#{(time_diff/1.day).to_i.round} day"
        end
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_id)
  end
end
