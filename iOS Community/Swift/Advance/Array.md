### reserveCapacity
> Reserves enough space to store the specified number of elements.
- 在確定array的size的時候，在操作前透過這個方法，可以設定好array的大小，以提升append的速度
- 但若使用不當的話，可能會導致速度變慢
- [Array performance: append() vs reserveCapacity()](https://www.hackingwithswift.com/articles/128/array-performance-append-vs-reservecapacity)