import Logout from "./Logout";

function UserPage({ logout }) {
  return (
    <div>
      <h1>Welcome back</h1>
      <Logout logout={logout} />
    </div>
  );
}

export default UserPage;