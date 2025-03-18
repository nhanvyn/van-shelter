<?php

?>



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Vancouver Shelter</title>
    <link rel="stylesheet" href="./css/index.css">
</head>

<body>
    <main>
        <div class="container">
            <form class="filter-form">
                <div class="search-filter">
                    <div class="top">
                        <label>Types:</label>
                        <div class="type-sec">

                            <input type="checkbox" value="Dog">
                            <label>Dog:</label>

                            <input type="checkbox" value="Cat">
                            <label>Cat:</label>

                            <input type="checkbox" value="Bird">
                            <label>Bird:</label>
                        </div>
                    </div>
                    <div class="bottom">
                        <div class="left">
                            <div class="breed-drop-down">
                                <label for="breeds">Choose a breed:</label>
                                <select name="breeds" id="breeds">
                                    <option value="pitbull">Pitbull</option>
                                    <option value="doberman">Doberman</option>
                                </select>
                            </div>

                            <div class="name-field">
                                <label for="name">Name: </label>
                                <input type="text" id="name">
                            </div>


                            <div class="sex-drop-down">
                                <label for="sex">Sex:</label>
                                <select name="sex" id="sex">
                                    <option value="M">M</option>
                                    <option value="F">F</option>
                                </select>
                            </div>

                        </div>
                        <div class="middle">
                            <div class="color-field">
                                <label for="color">Color: </label>
                                <input type="text" id="color">
                            </div>
                            <div class="age-drop-down">
                                <label for="age">Age group:</label>
                                <select name="age" id="age">
                                    <option value="Puppy">Puppy</option>
                                </select>
                            </div>

                            <div class="status-drop-down">
                                <label for="status">Status:</label>
                                <select name="status" id="status">
                                    <option value="transferred">transferred</option>
                                </select>
                            </div>
                        </div>
                        <div class="right">

                            <div class="source-drop-down">
                                <label for="source">Sources:</label>
                                <select name="source" id="source">
                                    <option value="VPD IMPOUND">VPD IMPOUND</option>
                                </select>
                            </div>


                            <div class="date-drop-down">
                                <label for="date">Within Past:</label>
                                <select name="date" id="date">
                                    <option value="1 year"> 1 year </option>
                                </select>
                            </div>

                            <div class="sort-drop-down">
                                <label for="sort">Sort By:</label>
                                <select name="sort" id="sort">
                                    <option value="Date Impound">Date Impound</option>
                                </select>
                            </div>
                        </div>
                    </div>


                    <div class="submit-sec"><button type="submit" class="submit-btn">Search</button></div>
                </div>
            </form>
        </div>

        <div class="container pet-sec">

           <div class="pet-grid">
                <div class="pet-card">
                    <div class="pet-card-header">
                        <h2>Name: Bulma </h2>
                        <p>🐱</p>
                    </div>
                    <p>Type: Cat  </p> 
                    <p>Age: Puppy</p>
                    <p>Impound Date: 01-01-2021</p>
                    <p>Status: Adoptable</p>
                    <p>Color: Yellow & White</p>
                    <button class="view-details">View Details</button>
                </div>
    
                <div class="pet-card">
                    <div class="pet-card-header">
                        <h2>Name: Bulma </h2>
                        <p>🐱</p>
                    </div>
                    <p>Type: Cat  </p> 
                    <p>Age: Puppy</p>
                    <p>Impound Date: 01-01-2021</p>
                    <p>Status: Adoptable</p>
                    <p>Color: Yellow & White</p>
                    <button class="view-details">View Details</button>
                </div>
    
                <div class="pet-card">
                    <div class="pet-card-header">
                        <h2>Name: Bulma </h2>
                        <p>🐱</p>
                    </div>
                    <p>Type: Cat  </p> 
                    <p>Age: Puppy</p>
                    <p>Impound Date: 01-01-2021</p>
                    <p>Status: Adoptable</p>
                    <p>Color: Yellow & White</p>
                    <button class="view-details">View Details</button>
                </div>

                
           </div>


            
        </div>
    </main>
</body>

</html>