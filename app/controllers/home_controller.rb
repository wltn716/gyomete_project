class HomeController < ApplicationController
  # 메일 양식 작성
  def form_write
    
  end
  
  # 메일 양식 작성 액션
  def form_action
    form = Form.new(title: params[:title], content: params[:content], hit: params[:hit], like: params[:like], hashtag: params[:hashtag])
    form.save
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
  
  # 커뮤니티 게시판 글 작성
  def post_write
  
  end
  
  # 커뮤니티 게시판 리스트 출력
  def post_list
      
  end
  
  # 커뮤니티 게시판 리스트에서 글 눌렀을 때, 제목과 내용 출력과 댓글 달기
  def post_view
  
  end
  
  # 커뮤니티 게시판에 대한 댓글 작성 action
  def post_reply
    
  end
  
end
