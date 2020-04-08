<template>
  <div class="home">
    <h1>{{ message }}</h1>
    <button v-on:click="showCreate()">Toggle To Create Contact</button>
    <div v-if="show">
      SHOW IS TRUE
    </div>
    <br>
    <br>
    <hr>
    <div v-bind:key="contact.id" v-for="contact in contacts">
      <p>Id: {{contact.id}}</p>
      <p>Full Name: {{contact.full_name}}</p>
      <div>
        <button v-on:click="showMore(contact)">Show More</button>
        <div v-if="currentContact === contact">
          <p>Email: {{contact.email}}</p>
          <p>Phone: {{contact.phone_number}}</p>
          <p>Bio: {{contact.bio}}</p>
        </div>
      </div>
      <hr>
    </div>
  </div>
</template>
<style>
</style>

<script>
import axios from "axios"

export default {
  data: function() {
    console.log("in the created");
    return {
      message: "Welcome to the Contacts App!",
      contacts: [],
      currentContact: {},
      show: false
    };
  },
  created: function() {
    axios.get("/api/contacts").then(response => {
      console.log(response.data);
      // contacts refers to the data variable above
      this.contacts = response.data;
    });
  },
  methods: {
    showMore(contact) {
      console.log("Showing more info...");
      this.currentContact = contact;
    },
    showCreate() {
      console.log("Showing create inputs");
      console.log(this.show);
      this.show = !this.show;
    }
  }
};
</script>