pragma solidity 0.5.0;

contract FoodSafe{

    struct Location{
        string name;
        string secret;
        uint locationId;
        uint PreviousLocationId;
        uint timestamp;

    }
    //trail of different location
    mapping(uint => Location) Trail;
    uint8 TrailCount =0;
    //to retrieve the trail count
    function getTrail() public payable returns  (uint8){
        return TrailCount;
    }

    function addLocation(uint locationId, string memory name, string memory secret) public payable {
        Location memory newLocation;
        newLocation.name = name;
        newLocation.locationId = locationId;
        newLocation.secret = secret;
        newLocation.timestamp = now;

        if(TrailCount != 0){
            newLocation.PreviousLocationId = Trail[TrailCount].locationId;

        }
        Trail[TrailCount] = newLocation;
        TrailCount ++;
    }

    function getLocation(uint8 TrailNo) public view returns(string memory, uint, uint, string memory, uint){
        return (Trail[TrailNo].name, Trail[TrailNo].locationId, Trail[TrailNo].PreviousLocationId, Trail[TrailNo].secret,Trail[TrailNo].timestamp);
    }
}