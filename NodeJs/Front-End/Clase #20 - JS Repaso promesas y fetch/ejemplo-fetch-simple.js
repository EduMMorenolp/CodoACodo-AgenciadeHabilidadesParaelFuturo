fetch('https://restcountries.com/v3.1/alpha?codes=br')
  .then(function (res) {
    return res.json();
  })
  .then(function (data) {
    console.log(data);
  });
