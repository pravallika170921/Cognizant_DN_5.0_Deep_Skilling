import { useState } from "react";
import GuestPage from "./GuestPage";
import UserPage from "./UserPage";

function App() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  return (
    <div className="App">
      {isLoggedIn ? (
        <UserPage logout={() => setIsLoggedIn(false)} />
      ) : (
        <GuestPage login={() => setIsLoggedIn(true)} />
      )}
    </div>
  );
}

export default App;