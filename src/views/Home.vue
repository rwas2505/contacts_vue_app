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
    <!-- contacts.each do |contact| -->
    <div v-bind:key="contact.id" v-for="contact in contacts">
      <p>Id: {{contact.id}}</p>
      <p>First Name: {{contact.first_name}}</p>
      <p>Last Name: {{contact.last_name}}</p>
      <div>
        <button v-on:click="showMore(contact)">Show More</button>
        <div v-if="currentContact === contact">
          <p>Email: {{contact.email}}</p>
          <p>Phone: {{contact.phone_number}}</p>
          <p>Bio: {{contact.bio}}</p>
          <button v-on:click="showUpdateContact()">Toggle To Update Contact</button>
          <div v-if="showUpdate">
              SHOW UPDATE IS TRUE
              <p>First Name: <input type="text" v-model="contact.first_name"></p>
              <p>Last Name: <input type="text" v-model="contact.last_name"></p>
              <p>Email: <input type="text" v-model="contact.email"></p>
              <p>Phone: <input type="text" v-model="contact.phone_number"></p>
              <p>Bio: <input type="text" v-model="contact.bio"></p>
            <button v-on:click="updateContact(contact)">Update Contact</button>
          </div>
          <br>
          <br>
        </div>
      </div>
        <hr>
     </div> <!--END contacts.each do |contact| -->
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
      show: false,
      showUpdate: false
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
    },
    showUpdateContact() {
      console.log("Showing update contact form");
      console.log(this.showUpdate);
      this.showUpdate = !this.showUpdate;
    },
    updateContact(theContact) {
      console.log("Updating contact...");
      console.log(theContact);
      console.log(theContact.id);
      console.log(theContact.first_name);

      var params = {
        // these keys need to match the controller params      
        first_name: theContact.first_name,
        last_name: theContact.last_name,
        email: theContact.email,
        phone_number: theContact.phone_number,
        bio: theContact.bio
      };

      console.log(params);

      axios.patch('/api/contacts/' + theContact.id, params).then(response => {
        console.log(response.data);
      });
    }
  }
};
</script>