import {Component, OnInit} from '@angular/core';
import { RestService } from './rest.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {

  users: any;

  constructor(public rest: RestService) {

  }

  ngOnInit() {
    this.rest.getUsers().subscribe((data: {}) => {
      console.log(data);
      this.users = data['users'];
    });
  }
}
