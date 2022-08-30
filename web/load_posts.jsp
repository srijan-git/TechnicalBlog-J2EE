<%@page import="com.tech.blog.model.Message" %>
<%@page import="com.tech.blog.model.User" %>
<%@page import="com.tech.blog.model.Post" %>
<%@page import="com.tech.blog.model.Category" %>
<%@page import="com.tech.blog.dao.PostDao" %>
<%@page import="com.tech.blog.dao.LikeDao" %>
<%@page import="com.tech.blog.helper.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>

<div class="row">


    <% 
         LikeDao ld=new LikeDao(connectionProvider.getConnection());
        User uuu=(User)session.getAttribute("currentUser");
        Thread.sleep(1000); 
    PostDao d=new PostDao(connectionProvider.getConnection()); 
    int cid=Integer.parseInt(request.getParameter("cid")); 
    List<Post> posts=null;
        if(cid==0){
        posts=d.getAllPosts();
        }else{
        posts=d.getPostByCatId(cid);
        }

        if(posts.size()==0){
        out.println("<h3 class='display-4 text-center'>No posts available in this category...</h3>");
        return;
        }
        for(Post p:posts)

        {
    %>

    <div class="col-md-6 mt-2">
        <div class="card">
            <img src="blog_pics/<%= p.getpPic()%>" class="card-image-top" alt="Card image cap">
            <div class="card-body">
                <b>
                    <%=p.getpTitle()%>
                </b>
                <p>
                    <%=p.getpContent()%>
                </p>

            </div>

            <div class="card-footer primary-background text-center">


                <a href="#"
                   class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i>
                    <span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span></a>

                <a href="show_blog_page.jsp?postID=<%= p.getPid()%>" class="btn btn-outline-light btn-sm">Read more...</a>

                <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-comment-o" aria-hidden="true"></i>
                    <span>20</span></a>
            </div>
        </div>
    </div>

    <% } %>
</div>