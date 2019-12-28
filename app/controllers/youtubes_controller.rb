class YoutubesController < ApplicationController

  GOOGLE_API_KEY ="AIzaSyDr8e--lZQ80wuJnrC4iVqcQa1Ivav3EJs"


 def find_videos(keyword, after: 1.months.ago, before: Time.now)
   service = Google::Apis::YoutubeV3::YouTubeService.new
   service.key = GOOGLE_API_KEY

   next_page_token = nil
   opt = {
     q: keyword,
     type: 'video',
     max_results: 6,
     order: :date,
     page_token: next_page_token,
     published_after: after.iso8601,
     published_before: before.iso8601
   }
   service.list_searches(:snippet, opt)
 end
  def index

     @youtube_data = find_videos('初年間FP')
  end

  def show
    @youtube =Youtube.find(params[:id])
    @c = "初年間FP"
    @youtube_data = find_videos(@c)
  end

  def new
    @youtube = Youtube.new
  end

  def create
    @youtube = Youtube.new(youtube_params)

    if @youtube.save
      redirect_to youtube_path(@youtube)
    else
      render :new
    end
  end

  def destroy
  end

  private
  def youtube_params
    params.require(:youtube).permit(:description)

  end
end
