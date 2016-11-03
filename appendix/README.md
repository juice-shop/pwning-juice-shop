# Appendix - Challenge solutions

All URLs in the challenge solutions assume you are running the application locally and on the default port http://localhost:3000. Change the URL accordingly if you use a different root URL.

### Find the carefully hidden 'Score Board' page. {#scoreBoardChallengeSolution}

1. Open the _Source code view_ of your brower from any screen of the Juice Shop application.
2. Scroll down to the end of the `<nav>` tag that defines the menu bar (see code snippet below).
3. Notice the commented out `<li>` entry labeled "Score Board".
4. Navigate to http://localhost:3000/#/score-board to solve the challenge.

```
      <li class="dropdown">
          <a href="#/contact"><i class="fa fa-comment fa-lg"></i> <span translate="TITLE_CONTACT"></span></a>
      </li>
      <li class="dropdown" ng-show="isLoggedIn()">
          <a href="#/complain"><i class="fa fa-bomb fa-lg"></i> <span translate="NAV_COMPLAIN"></span></a>
      </li>
      <!--
      <li class="dropdown">
          <a href="#/score-board">Score Board</a>
      </li>
      -->
      <li class="dropdown ribbon-spacer">
          <a href="#/about"><i class="fa fa-info-circle fa-lg"></i> <span translate="TITLE_ABOUT"></span></a>
      </li>
    </ul>
  </div>
</nav
```
