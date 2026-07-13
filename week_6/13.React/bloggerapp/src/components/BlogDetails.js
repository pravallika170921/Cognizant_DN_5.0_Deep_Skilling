function BlogDetails(props) {

  return (
    <div className="box">

      <h1>Blog Details</h1>

      {props.blogs.map((blog) => (
        <div key={blog.id}>
          <h3>{blog.title}</h3>
          <h4>{blog.author}</h4>
          <p>{blog.description}</p>
        </div>
      ))}

    </div>
  );
}

export default BlogDetails;