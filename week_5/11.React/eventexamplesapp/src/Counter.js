import React, { useState } from "react";

function Counter() {
  const [count, setCount] = useState(5);
  const [amount, setAmount] = useState("");
  const [currency, setCurrency] = useState("");

  const increment = () => {
    setCount(count + 1);
  };

  const decrement = () => {
    setCount(count - 1);
  };

  const sayHello = () => {
    alert("I was clicked");
  };

  // Increment button calls multiple methods
  const handleIncrement = () => {
    increment();
    sayHello();
  };

  // Say Welcome button
  const sayWelcome = (msg) => {
    alert(msg);
  };

  // Synthetic Event
  const handleClick = (e) => {
    e.preventDefault();
    alert("I was clicked");
  };

  // Currency Converter
  const handleSubmit = () => {
    const euro = parseFloat(amount) / 90; // Example conversion
    setCurrency(euro.toFixed(2));
    alert(`Converting to Euro: ${euro.toFixed(2)}`);
  };

  return (
    <div style={{ margin: "20px" }}>
      <h2>{count}</h2>

      <button onClick={handleIncrement}>Increment</button>
      <br /><br />

      <button onClick={decrement}>Decrement</button>
      <br /><br />

      <button onClick={() => sayWelcome("Welcome")}>
        Say Welcome
      </button>
      <br /><br />

      <button onClick={handleClick}>
        Click on me
      </button>

      <h1 style={{ color: "green", marginTop: "30px" }}>
        Currency Convertor!!!
      </h1>

      <table>
        <tbody>
          <tr>
            <td>Amount</td>
            <td>
              <input
                type="number"
                value={amount}
                onChange={(e) => setAmount(e.target.value)}
              />
            </td>
          </tr>

          <tr>
            <td>Currency:</td>
            <td>
              <input
                type="text"
                value={currency}
                readOnly
              />
            </td>
          </tr>

          <tr>
            <td></td>
            <td>
              <button onClick={handleSubmit}>
                Submit
              </button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  );
}

export default Counter;