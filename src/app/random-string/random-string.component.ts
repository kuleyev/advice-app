import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-random-string',
  templateUrl: './random-string.component.html',
  styleUrls: ['./random-string.component.css']
})
export class RandomStringComponent {
  randomString: string = "Hit this fucking button!";
  description: string = "If you want to get great advice =)"

  constructor(private http: HttpClient) { }

  getRandomString() {
    this.http.get('https://advice-api.herokuapp.com/advice').subscribe((data: any) => {
      this.randomString = data.advice;
      this.description = data.description;
    });
  }
}
