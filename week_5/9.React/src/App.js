import React from "react";
import { ListofPlayers, ScoreBelow70 } from "./ListofPlayers";
import IndianTeam, {
  OddPlayers,
  EvenPlayers,
  IndianPlayers,
  ListofIndianPlayers
} from "./IndianPlayers";

function App() {

  // Change to false to see the second output
  const flag = false;

  if (flag === true) {
    return (
      <div>
        <h1>List of Players</h1>
        <ListofPlayers />

        <hr />

        <h1>List of Players having Scores Less than 70</h1>
        <ScoreBelow70 />
      </div>
    );
  } else {
    return (
      <div>
        <h1>Indian Team</h1>

        <h2>Odd Players</h2>
        <OddPlayers players={IndianTeam} />

        <hr />

        <h2>Even Players</h2>
        <EvenPlayers players={IndianTeam} />

        <hr />

        <h2>List of Indian Players Merged</h2>
        <ListofIndianPlayers IndianPlayers={IndianPlayers} />
      </div>
    );
  }
}

export default App;