import "./main.css";
import { Elm as blog1 } from "./Blog1.elm";
import { Elm as blog2 } from "./Blog2.elm";
import { Elm as blog3 } from "./Blog3.elm";
import { Elm as blog4 } from "./Blog4.elm";
import * as serviceWorker from "./serviceWorker";

// const blog = blog1.Blog1;
// const blog = blog2.Blog2;
// const blog = blog3.Blog3;
const blog = blog4.Blog4;

blog.init({
  node: document.getElementById("root"),
});

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
