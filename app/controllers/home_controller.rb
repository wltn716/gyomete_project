require 'mailgun'
class HomeController < ApplicationController
  before_action :authenticate_user!
  impressionist :actions => [:show]
  
  #마이페이지 입니다.
  def mypage
     @forms=Form.where(writer: current_user).take(3)
     @posts=Post.where(writer: current_user).take(3)
     @scraps=Scrap.where(writer: current_user).take(3)
     @reply_forms=Freply.where(writer: current_user).take(3)
    
    
  end
  
  #내가 쓴 메일 양식 보관함
  def mypage_mail_archive 
    @forms=Form.where(writer: current_user)
  end
  
  #내가 쓴 커뮤니티 게시글
  def mypage_community_archive
    @posts=Post.where(writer: current_user)
  end
  
  #내가 스크랩한 글
  def mypage_scrap_archive
    @scraps=Scrap.where(writer: current_user)
  end
  def mypage_reply_archive
    @reply_forms=Freply.where(writer: current_user)
  end
  
  def firstpage
    @forms = Form.all
    @posts = Post.all
  end
  def firstpage_result
    
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
    form = Form.create
    form.writer = current_user
    form.category = params[:category]
    form.title = params[:title]
    form.content = params[:content]
    form.hashtag = params[:hashtag]
    form.save
    
    redirect_to "/form_list/" + params[:category]
  end
  
  def liking
    @forming = Form.find(params[:form_id])
    if @forming.likers.include? current_user
      @forming.likers.delete(current_user)
    else
      @forming.likers << current_user
    end
  end
  
  # 메일 양식 리스트 출력
  def form_list
    @forms = Form.where(category: params[:category])
    @forms.each do |best|
      if best.likers.max
        @best_form_id = best.id
        @best_form_title = best.title
        @best_form_likers = best.likers.count
        @best_form_replies = best.freplies.count
        @best_form_time = best.created_at.strftime("%Y-%m-%d")
        @best_form_writer = best.writer.nickname
        @best_form_hit_count = best.impressionist_count
      end
    end
  
    Freply.all
  end
  
  # 작성된 하나하나의 메일 양식 & 댓글 출력 
  def form_view
    @view_form = Form.find(params[:form_id])
    impressionist(@view_form)
    Freply.all
  end
  
  def form_destroy
    @one_form = Form.find(params[:form_id]) 
    authorize! :manage, @one_form
    @one_form.destroy
    redirect_to "/form_list/1"
  end
  
  def form_update
    @one_form = Form.find(params[:form_id])
    authorize! :manage, @one_form
  end
  
  def form_update_action
    @one_form = Form.find(params[:form_id]) 
    @one_form.title= params[:title] 
    @one_form.content = params[:content]
    @one_form.hashtag = params[:hashtag]
    @one_form.save
    redirect_to "/form_view/"+params[:form_id] 
  end
  
  # 양식에 대한 댓글 작성 action
  def form_reply
    freply = Freply.new(content: params[:reply_f], form_id: params[:id_of_form], writer: current_user)
    freply.save
    redirect_to "/form_view/" + params[:id_of_form]
    
    
  end
  
  def form_reply_destroy
    
    @reply_form = Freply.find(params[:reply_id])
    authorize! :manage, @reply_form
    @reply_form.destroy
    redirect_to :back  
  end
  
  def form_scrap_action
    scrap = Scrap.create(title: params[:scrap_title],nickname: params[:scrap_nickname],time: params[:scrap_time],likes: params[:scrap_likes],hits: params[:scrap_hits],replies: params[:scrap_replies], scrap_id: params[:scrap_id], writer: current_user)
    scrap.save
    redirect_to :back
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
                       from: current_user.email,
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
    post.writer = current_user
    #file = params[:pic]
    #uploader = GyometeCommunityUploader.new
    #uploader.store!(file)
    #post.image_url = uploader.url
    post.save
    
    redirect_to "/post_list"  
  end
  
  # 커뮤니티 게시판 리스트 출력
  def post_list
    @posts = Post.all.reverse  
    @posts = Post.all  
  end
  
  # 커뮤니티 게시판 리스트에서 검색했을 때 결과
  def post_result
    @posts = Post.search(params[:search].reverse)
    @posts = Post.search params[:search]
  end
  
  # 커뮤니티 게시판 리스트에서 글 눌렀을 때, 제목과 내용 출력과 댓글 달기
  def post_view
    @view_post = Post.find(params[:post_id])
    impressionist(@view_post)
    Preply.all

  end
  
  def post_destroy
    @one_post = Post.find(params[:post_id]) 
    @one_post.destroy
    redirect_to "/post_list"
  end
  
  def post_update
    @one_post = Post.find(params[:post_id])
  end
  
  def post_update_action
    @one_post = Post.find(params[:post_id]) 
    @one_post.title= params[:title] 
    @one_post.content = params[:content]
    @one_post.save
    redirect_to "/post_list" 
  end
  
  # 커뮤니티 게시판에 대한 댓글 작성 action
  def post_reply
    preply = Preply.new(content: params[:reply_p], post_id: params[:id_of_post], writer: current_user)
    preply.save
    redirect_to "/post_view/" + params[:id_of_post]
  end

#대부분 커뮤니티 참고해봤을때, 댓글은 삭제 기능만 있는 게 많아서 구현 안해놓았습니다.  
  def post_reply_destroy
    
    @reply_post = Preply.find(params[:reply_id])
    #위에 들어갈 id 값이 왜 다 넣어봤는데 안되는 걸까..광광...
    @reply_post.destroy
    redirect_to :back  
  end
  

  def my_info
    
  
  end  
  
  
end
