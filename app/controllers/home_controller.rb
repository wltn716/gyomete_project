require 'mailgun'
class HomeController < ApplicationController
  # 메일 양식 작성
  def form_write
    @forms=Form.all
    
  end
  
  # 메일 양식 작성 액션
  def form_action
    form = Form.new(title: params[:title], content: params[:content], hit: params[:hit], like: params[:like], hashtag: params[:hashtag])
    form.save
    @receiver = params[:receiver]
    mg_client = Mailgun::Client.new("your-api-key")
    
    message_params =  {
                       from: current_user.email,
                       to:   @receiver,
                       subject: params[:title],
                       text:    params[:content]
                      }
    
    result = mg_client.send_message('sandbox41ceb00888d0479096b32609df172ab0.mailgun.org', message_params).to_h!
    
    message_id = result['id']
    message = result['message']
    redirect_to "/home/form_view"
  end
  
  # 메일 양식 리스트 출력
  def form_list
    #카테고리 출력하는 action필요함 카테고리는 value값으로 받기
  end
  
  # 작성된 하나하나의 메일 양식 & 댓글 출력 
  def form_view
    @forms = Form.all
    Freply.all
  end
  
  # 양식에 대한 댓글 작성 action
  def form_reply
    freply = Freply.new(content: params[:reply_f], form_id: params[:id_of_form])
    freply.save
    redirect_to "/home/form_view"
  end
  
  #해시태그만들기1
  def form_result
    @forms = Form.search(params[:search]).reverse
  end
  
  # 커뮤니티 게시판 글 작성
  def post_write
    #@posts = Post.all
  end
  
  #게시판 글 작성 액션
  def post_action
    post = Post.new
    post.title = params[:title]
    post.content = params[:content]
    file = params[:pic]
    uploader = GyometeCommunityUploader.new
    uploader.store!(file)
    post.image_url = uploader.url
    
      redirect_to "/home/post_list"  
    # 나중에 post_view로 redirect_to 시키게끔해야 함..! 
      
  end
  
  # 커뮤니티 게시판 리스트 출력
  def post_list
  @posts_title = Post.all
  end
  
  # 커뮤니티 게시판 리스트에서 글 눌렀을 때, 제목과 내용 출력과 댓글 달기
  def post_view

  
  end
  
  # 커뮤니티 게시판에 대한 댓글 작성 action
  def post_reply
    
  end
  
end
