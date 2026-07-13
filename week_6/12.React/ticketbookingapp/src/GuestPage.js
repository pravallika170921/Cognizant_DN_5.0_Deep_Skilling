import Login from "./Login";

function GuestPage({ login }) {
  return (
    <div>
      <h1>Please sign up.</h1>
      <Login login={login} />
    </div>
  );
}

export default GuestPage;