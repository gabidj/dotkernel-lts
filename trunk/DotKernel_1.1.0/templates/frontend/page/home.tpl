<p>	
	<h3>1. Special Controllers</h3>
	<p>Backend: <a href="{SITE_URL}/admin/ ">Admin </a></p>
	<p>RSS: <a href="{SITE_URL}/rss/ ">RSS </a></p>
	<p>Ajax: <a href="{SITE_URL}/ajax/ ">Ajax </a></p>
	<p>Also the above controllers are <b>reserved words</b> so you cannot have an action called
	<b>admin</b>, <b>rss</b> or <b>ajax</b> in frontend</p>

	<h3>2. URL pattern</h3>
	 <p>-  <b>for default module frontend, all url's will be like:</b> </p>
	  <p><i>/controller/action/var1/value-of-var1/var2/value-of-var2/</i></p>
   <p>-  <b>and for admin will be:</b></p>
	 <p><i>/admin/controller/action/var1/value-of-var1/var2/value-of-var2/</i></p>

	 <h3>3. Adding a new Controller, called <i>Articles</i> , for instance, in frontend, you need to add 3 files </h3>
	 		<p>- <b>CONTROLLER</b>: <i>controllers/frontend/articlesController.php</i> , which contain the switch </p>
	   <p>- <b>MODEL</b>:      <i>DotKernel/frontend/Articles.php</i>, which contain class Articles </p>
		 <p>- <b>VIEW</b>:       <i>DotKernel/frontend/views/articlesView.php</i> , which contain class Articles_View<br />
		    and the folder <i>templates/frontend/articles/</i> with the necessary template files</p>
		 

		 <p>- you <b>MUST</b>  add in <b>config/application.ini</b> the line:</p>
		 <p>resources.controllers.frontend.articles = Articles</p>
		 
		<h3>4. Structure of folders</h3>
		<img src="{IMAGES_URL}/MVC-structure.png" alt="" />
		 
</p>