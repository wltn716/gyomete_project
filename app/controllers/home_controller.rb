require 'mailgun'
class HomeController < ApplicationController
  impressionist :actions => [:show]
  
  def firstpage
    #unless user_signed_in?
      #redirect_to "/users/sign_in"
    #end
  end
  def firstpage_result
    @forms = Form.all
    if params[:search]
      @forms = Form.search(params[:search]).reverse
      @posts = Post.search(params[:search]).reverse
    else
    end
  end
  
  # 메일 양식 작성
  def form_write
  end
  
  # 메일 양식 작성 액션
  def form_action
    #writer: params[:nickname]추가예정
    form = Form.new
    form.title = params[:title]
    form.content = params[:content]
    form.hashtag = params[:hashtag]
    form.save
    
    redirect_to "/home/form_list"
  end
  
  # 메일 양식 리스트 출력
  def form_list
    #카테고리 출력하는 action필요함 카테고리는 value값으로 받기
    @forms = Form.all  
  
  end
  
  # 작성된 하나하나의 메일 양식 & 댓글 출력 
  def form_view
    @view_form = Form.find(params[:form_id])
    impressionist(@view_form)
    Freply.all
  end
  
  # 양식에 대한 댓글 작성 action
  def form_reply
    freply = Freply.new(content: params[:reply_f], form_id: params[:id_of_form])
    freply.save
    redirect_to "/form_view/"+params[:id_of_form]
  end
  
  #해시태그만들기1
  def form_result
    @forms = Form.search(params[:search]).reverse
  end
  
  #메일보내기
  
  def form_mail
    @one_form = Form.find(params[:form_id])
  
  end
  
  def form_m_update
    @receiver = params[:receiver]
    mg_client = Mailgun::Client.new("key-f6f12a06f7725629b847ba47b4b04815")
    
    message_params =  {
                       from: "hahiho716@naver.com",
                       to:   @receiver,
                       subject: params[:title],
                       text:    params[:content]
                      }
    
    result = mg_client.send_message('sandbox41ceb00888d0479096b32609df172ab0.mailgun.org', message_params).to_h!
    
    message_id = result['id']
    message = result['message']

    @one_form = Form.find(params[:form_id])
    
  
    
    redirect_to "/form_view/"+params[:form_id]
  
  end
  
  # 커뮤니티 게시판 글 작성
  def post_write
    #@posts_title = Post.all
  end
  
  #게시판 글 작성 액션
  def post_action
    post = Post.new
    post.title = params[:title]
    post.content = params[:content]
    #file = params[:pic]
    #uploader = GyometeCommunityUploader.new
    #uploader.store!(file)
    #post.image_url = uploader.url
    post.save
    
    redirect_to "/home/post_list"  
  end
  
  # 커뮤니티 게시판 리스트 출력
  def post_list
    @posts = Post.all  
  end
  
  # 커뮤니티 게시판 리스트에서 검색했을 때 결과
  def post_result
    @posts = Post.search params[:search]
  end
  
  # 커뮤니티 게시판 리스트에서 글 눌렀을 때, 제목과 내용 출력과 댓글 달기
  def post_view

  @view_post = Post.find(params[:post_id])
  end
  
  # 커뮤니티 게시판에 대한 댓글 작성 action
  def post_reply
    
  end
  
  def my_info
    
  
  end  
  
  
end
