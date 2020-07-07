import React from "react";
import ReactDOM from "react-dom";
import "./index.css";
import App from "./components/App";
import registerServiceWorker from "./registerServiceWorker";
import * as Sentry from "@sentry/react";

Sentry.init({
  dsn:
    "https://2331ef4ccd3f4cbabaac2a6f510a8edc@o416919.ingest.sentry.io/5315536",
});

ReactDOM.render(<App />, document.getElementById("root"));

registerServiceWorker();
