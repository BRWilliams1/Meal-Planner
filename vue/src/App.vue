<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div>
    <router-view />








    

<!-- *{
    margin: 0;
    padding: 0;
}

.main{
    width: 100%;
    background: linear-gradient(to top, rgba(0,0,0,0.5)50%,rgba(0,0,0,0.5)50%), url(https://images.onlymyhealth.com//imported/images/2023/April/17_Apr_2023/Main_greens.jpg)
    background-position center;
    background-size: cover;
    height: 109vh;
}

.navbar{
    width: 1200px;
    height: 75px;
    margin: auto;
}

.icon{
    width:200px;
    float: left;
    height:70px;
}

.logo{
    color:orange
    font-size 35px;
    font-family: Arial, Helvetica, sans-serif
    padding-left 20px;
    float: left;
    padding-top:10px;
}
.menu{
    width: 400px;
    float: left;
    justify-content: center;
    align-items: center;
}
ul{
    float: left;
    display: flex;
    justify-content: center;
    align-items: center;
}
ul li{
    list-style: none;
    margin-left: 62px;
    margin-top: 27px;
    font-size: 14px;
}
ul li a{
    text-decoration: none;
    color: whitesmoke;
    font-family: Arial, Helvetica, sans-serif;
    font-weight: bold;
    transition: 0.4s ease-in-out;
}

ubl li a:hover{
    color:tomato;
}

.search{
    width: 330px;
    float: left;
    margin-left: 270px;;
}

.srch{
font-family: 'Times New Roman';
width: 200px;
height: 40px;
background: transparent;
border: 1px solid orange;
margin-top: 13px;
color: whitesmoke;
border-right: none;
font-size: 16px;
float: left;
padding: 10px;

} -->


  </div>
</template>
