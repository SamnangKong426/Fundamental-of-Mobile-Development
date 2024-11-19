1. What type of data will store the jokes?
```
Data Type:
A list of JokeData objects (List<JokeData>), where each object represents a joke with properties:
- title (String)
- description (String)
- isFavorite (bool)
```

2. What type of data will store the favorite joke?
```
Data Type:
int? to store the index of the favorite joke in the list.
Alternatively, you could store the ID or reference to the JokeData object itself.
```

3. Which widget should be in charge of storing the favorite joke?

```
The parent widget (FavoriteJokesApp) is responsible for managing the favorite joke state. (_favoriteIndex)It store only 1 joke best joke index.
```

4. Which widget should be stateful?

```
Parent widget (FavoriteJokesApp) needs to be stateful to manage the favorite joke's state.
Child widgets (FavoriteCard) can remain stateless because they rely on props passed from the parent.
```

5. How will your widgets interact?

```
The parent widget maintains the favorite joke state and provides it to each child via props.
Each FavoriteCard receives:
    isFavorite: Whether the card is the favorite.
    onFavoriteClick: A callback function to notify the parent of the user's action.
```

6. Do you need to pass a callback function between widgets?

```
Yes, a callback function is required.
    Each FavoriteCard widget needs an onFavoriteClick function.
    This function notifies the parent widget when a user marks the joke as favorite.
```