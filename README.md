<h1> portfolio-project-cinema-planner </h1>
<br>
<p>The cinema planner apps aims to help users keep track of hte movies they plan to watch this year</p>
<p>It also helps know which movies they watched this year<p>
<hr>
<div align="center">
<img src="./images/homeView.png" alt="User Places" height="400" width="400"/>
</div>
ios uikit for client side and express js to help keep track of movies watched and planning to watch at the cinema

Building the Client side APP uisng Swift and UIKit. I opted to build the UI programatically insetad of using storyboards
Building the API using NestJS

<hr>
## Link to video of Demo of POC can be found on
https://www.loom.com/share/39132ad5764c4bbb9daf50258af71e3d
<hr>
<br>
<h2> iOS skills, tools and patters displayed <h/2>
- <b>Swift Package Manager</b> - to add sd_web_image
- <b>WebView</b> - Use of embedded web pages through
- <b>CoreData</b> - To store and persist downloaded Videos
- <b> Notification Center</b> - To add Movies to downloaded list
- <b>Observers</b> - to listen to changes on Notification Center
- <b>Optimisations</b> - to keep the application size as small as possible, I limited my reliance on third party packages. For example I decided to build my own methods to make http requests intsead of using a thrid pary library.

<div align="center">
<img src="./images/blankCredentials.png" alt="User Places" height="400" width="400"/>
</div>

<h2>Design Patterns</h2>
<h3><b>MVVM</b></3>
<p>THe project is structured to follow the MVVM design pattern.</p>
<p>Intially the project was built to follow MVC however the ViewController started getting too big and I deciced to split it up</p>

<h3><b>Delegate Pattern</b></h3>
<p>To keep my classes lean, I opted to use delegates in order to pass on functionality to other classes</p>

<h3>Extensions</h3>
<p>I extended the functionality of the many built in view controllers to add some custom logic specific to the requirements of this application.</p>
<p>I also extracted these extensions into their own files to keep the ViewControllers Lean

<div align="center">
<img src="./images/blankSearchView.png" alt="User Places" height="400" width="400"/>
</div>

<h2>System Colos</h2>
<p>I opted to use <i> system colors</i> for this application in order to support light and dark mode.

<div align="center">
<img src="./images/UpcomingLight.png" alt="User Places" height="400" width="400"/>
</div>