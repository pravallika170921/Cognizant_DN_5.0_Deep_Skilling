import BookDetails from "./components/BookDetails";
import BlogDetails from "./components/BlogDetails";
import CourseDetails from "./components/CourseDetails";

function App() {

  const books = [
    { id: 101, bname: "Master React", price: 670 },
    { id: 102, bname: "Deep Dive into Angular 11", price: 800 },
    { id: 103, bname: "Mongo Essentials", price: 450 }
  ];

  const blogs = [
    {
      id: 1,
      title: "React Learning",
      author: "Stephen Biz",
      description: "Welcome to learning React!"
    },
    {
      id: 2,
      title: "Installation",
      author: "Schwedenier",
      description: "You can install React from npm."
    }
  ];

  const courses = [
    {
      id: 1,
      cname: "Angular",
      date: "4/5/2021"
    },
    {
      id: 2,
      cname: "React",
      date: "6/3/2021"
    }
  ];

  const showBooks = true;
  const showBlogs = true;
  const showCourses = true;

  return (
    <div className="container">

      {/* Logical AND */}
      {showCourses && <CourseDetails courses={courses} />}

      {/* Ternary Operator */}
      {showBooks ? <BookDetails books={books} /> : <h2>No Books</h2>}

      {/* Element Variable */}
      {(() => {
        let content;
        if (showBlogs) {
          content = <BlogDetails blogs={blogs} />;
        } else {
          content = <h2>No Blogs</h2>;
        }
        return content;
      })()}

    </div>
  );
}

export default App;