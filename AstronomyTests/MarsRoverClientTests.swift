//
//  MarsRoverClientTests.swift
//  AstronomyTests
//
//  Created by Alexander Supe on 25.02.20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import Astronomy

class MarsRoverClientTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testFetchMarsRover() {
        let fetchExpectation = expectation(description: "fetchSucceeded")
        let client = MarsRoverClient(with: MockLoader(data: roverData, error: nil))
        client.fetchMarsRover(named: "curiosity") { (rover, error) in
            XCTAssertTrue(rover != nil)
            XCTAssert(error == nil)
            fetchExpectation.fulfill()
        }
        wait(for: [fetchExpectation], timeout: 10)
    }
    
    func testFetchPhotos() {
        let fetchExpectation = expectation(description: "fetchSucceeded")
        let client = MarsRoverClient(with: MockLoader(data: data, error: nil))
        client.fetchPhotos(from: rover, onSol: 1) { (reference, error) in
            XCTAssertTrue(reference != nil)
            XCTAssertFalse(reference?.isEmpty ?? true)
            XCTAssert(error == nil)
            fetchExpectation.fulfill()
        }
        wait(for: [fetchExpectation], timeout: 10)
    }
    
    let rover = MarsRover(name: "Curiosity", launchDate: Date(), landingDate: Date(), status: .active, maxSol: 2, maxDate: Date(), numberOfPhotos: 5, solDescriptions: [SolDescription]())
    let roverData = """
    {
        "photo_manifest": {
            "name": "Curiosity",
            "landing_date": "2012-08-06",
            "launch_date": "2011-11-26",
            "status": "active",
            "max_sol": 10,
            "max_date": "2012-08-16",
            "total_photos": 4156,
            "photos": [{
                    "sol": 0,
                    "earth_date": "2012-08-06",
                    "total_photos": 3702,
                    "cameras": [
                        "CHEMCAM",
                        "FHAZ",
                        "MARDI",
                        "RHAZ"
                    ]
                },
                {
                    "sol": 1,
                    "earth_date": "2012-08-07",
                    "total_photos": 16,
                    "cameras": [
                        "MAHLI",
                        "MAST",
                        "NAVCAM"
                    ]
                },
                {
                    "sol": 2,
                    "earth_date": "2012-08-08",
                    "total_photos": 74,
                    "cameras": [
                        "NAVCAM"
                    ]
                },
                {
                    "sol": 3,
                    "earth_date": "2012-08-09",
                    "total_photos": 338,
                    "cameras": [
                        "MAST"
                    ]
                },
                {
                    "sol": 10,
                    "earth_date": "2012-08-16",
                    "total_photos": 26,
                    "cameras": [
                        "CHEMCAM",
                        "MAHLI",
                        "NAVCAM"
                    ]
                }
            ]
        }
    }
    """.data(using: .utf8)!
    let data = """
    {
    "photos": [
    {
      "id": 4477,
      "sol": 1,
      "camera": {
        "id": 22,
        "name": "MAST",
        "rover_id": 5,
        "full_name": "Mast Camera"
      },
      "img_src": "http://mars.jpl.nasa.gov/msl-raw-images/msss/00001/mcam/0001ML0000001000I1_DXXX.jpg",
      "earth_date": "2012-08-07",
      "rover": {
        "id": 5,
        "name": "Curiosity",
        "landing_date": "2012-08-06",
        "launch_date": "2011-11-26",
        "status": "active",
        "max_sol": 2540,
        "max_date": "2019-09-28",
        "total_photos": 366206,
        "cameras": [
          {
            "name": "FHAZ",
            "full_name": "Front Hazard Avoidance Camera"
          },
          {
            "name": "NAVCAM",
            "full_name": "Navigation Camera"
          },
          {
            "name": "MAST",
            "full_name": "Mast Camera"
          },
          {
            "name": "CHEMCAM",
            "full_name": "Chemistry and Camera Complex"
          },
          {
            "name": "MAHLI",
            "full_name": "Mars Hand Lens Imager"
          },
          {
            "name": "MARDI",
            "full_name": "Mars Descent Imager"
          },
          {
            "name": "RHAZ",
            "full_name": "Rear Hazard Avoidance Camera"
          }
        ]
      }
    },
    {
      "id": 509233,
      "sol": 1,
      "camera": {
        "id": 22,
        "name": "MAST",
        "rover_id": 5,
        "full_name": "Mast Camera"
      },
      "img_src": "http://mars.jpl.nasa.gov/msl-raw-images/msss/00001/mcam/0001MR0000001000C0_DXXX.jpg",
      "earth_date": "2012-08-07",
      "rover": {
        "id": 5,
        "name": "Curiosity",
        "landing_date": "2012-08-06",
        "launch_date": "2011-11-26",
        "status": "active",
        "max_sol": 2540,
        "max_date": "2019-09-28",
        "total_photos": 366206,
        "cameras": [
          {
            "name": "FHAZ",
            "full_name": "Front Hazard Avoidance Camera"
          },
          {
            "name": "NAVCAM",
            "full_name": "Navigation Camera"
          },
          {
            "name": "MAST",
            "full_name": "Mast Camera"
          },
          {
            "name": "CHEMCAM",
            "full_name": "Chemistry and Camera Complex"
          },
          {
            "name": "MAHLI",
            "full_name": "Mars Hand Lens Imager"
          },
          {
            "name": "MARDI",
            "full_name": "Mars Descent Imager"
          },
          {
            "name": "RHAZ",
            "full_name": "Rear Hazard Avoidance Camera"
          }
        ]
      }
    },
    {
      "id": 509234,
      "sol": 1,
      "camera": {
        "id": 22,
        "name": "MAST",
        "rover_id": 5,
        "full_name": "Mast Camera"
      },
      "img_src": "http://mars.jpl.nasa.gov/msl-raw-images/msss/00001/mcam/0001ML0000001000C0_DXXX.jpg",
      "earth_date": "2012-08-07",
      "rover": {
        "id": 5,
        "name": "Curiosity",
        "landing_date": "2012-08-06",
        "launch_date": "2011-11-26",
        "status": "active",
        "max_sol": 2540,
        "max_date": "2019-09-28",
        "total_photos": 366206,
        "cameras": [
          {
            "name": "FHAZ",
            "full_name": "Front Hazard Avoidance Camera"
          },
          {
            "name": "NAVCAM",
            "full_name": "Navigation Camera"
          },
          {
            "name": "MAST",
            "full_name": "Mast Camera"
          },
          {
            "name": "CHEMCAM",
            "full_name": "Chemistry and Camera Complex"
          },
          {
            "name": "MAHLI",
            "full_name": "Mars Hand Lens Imager"
          },
          {
            "name": "MARDI",
            "full_name": "Mars Descent Imager"
          },
          {
            "name": "RHAZ",
            "full_name": "Rear Hazard Avoidance Camera"
          }
        ]
      }
    },
    {
      "id": 509235,
      "sol": 1,
      "camera": {
        "id": 22,
        "name": "MAST",
        "rover_id": 5,
        "full_name": "Mast Camera"
      },
      "img_src": "http://mars.jpl.nasa.gov/msl-raw-images/msss/00001/mcam/0001MR0000001000I1_DXXX.jpg",
      "earth_date": "2012-08-07",
      "rover": {
        "id": 5,
        "name": "Curiosity",
        "landing_date": "2012-08-06",
        "launch_date": "2011-11-26",
        "status": "active",
        "max_sol": 2540,
        "max_date": "2019-09-28",
        "total_photos": 366206,
        "cameras": [
          {
            "name": "FHAZ",
            "full_name": "Front Hazard Avoidance Camera"
          },
          {
            "name": "NAVCAM",
            "full_name": "Navigation Camera"
          },
          {
            "name": "MAST",
            "full_name": "Mast Camera"
          },
          {
            "name": "CHEMCAM",
            "full_name": "Chemistry and Camera Complex"
          },
          {
            "name": "MAHLI",
            "full_name": "Mars Hand Lens Imager"
          },
          {
            "name": "MARDI",
            "full_name": "Mars Descent Imager"
          },
          {
            "name": "RHAZ",
            "full_name": "Rear Hazard Avoidance Camera"
          }
        ]
      }
    },
    {
      "id": 3778,
      "sol": 1,
      "camera": {
        "id": 24,
        "name": "MAHLI",
        "rover_id": 5,
        "full_name": "Mars Hand Lens Imager"
      },
      "img_src": "http://mars.jpl.nasa.gov/msl-raw-images/msss/00001/mhli/0001MH0000001000I3_DXXX.jpg",
      "earth_date": "2012-08-07",
      "rover": {
        "id": 5,
        "name": "Curiosity",
        "landing_date": "2012-08-06",
        "launch_date": "2011-11-26",
        "status": "active",
        "max_sol": 2540,
        "max_date": "2019-09-28",
        "total_photos": 366206,
        "cameras": [
          {
            "name": "FHAZ",
            "full_name": "Front Hazard Avoidance Camera"
          },
          {
            "name": "NAVCAM",
            "full_name": "Navigation Camera"
          },
          {
            "name": "MAST",
            "full_name": "Mast Camera"
          },
          {
            "name": "CHEMCAM",
            "full_name": "Chemistry and Camera Complex"
          },
          {
            "name": "MAHLI",
            "full_name": "Mars Hand Lens Imager"
          },
          {
            "name": "MARDI",
            "full_name": "Mars Descent Imager"
          },
          {
            "name": "RHAZ",
            "full_name": "Rear Hazard Avoidance Camera"
          }
        ]
      }
    },
    {
      "id": 86520,
      "sol": 1,
      "camera": {
        "id": 24,
        "name": "MAHLI",
        "rover_id": 5,
        "full_name": "Mars Hand Lens Imager"
      },
      "img_src": "http://mars.jpl.nasa.gov/msl-raw-images/msss/00001/mhli/0001MH0000002000C0_DXXX.jpg",
      "earth_date": "2012-08-07",
      "rover": {
        "id": 5,
        "name": "Curiosity",
        "landing_date": "2012-08-06",
        "launch_date": "2011-11-26",
        "status": "active",
        "max_sol": 2540,
        "max_date": "2019-09-28",
        "total_photos": 366206,
        "cameras": [
          {
            "name": "FHAZ",
            "full_name": "Front Hazard Avoidance Camera"
          },
          {
            "name": "NAVCAM",
            "full_name": "Navigation Camera"
          },
          {
            "name": "MAST",
            "full_name": "Mast Camera"
          },
          {
            "name": "CHEMCAM",
            "full_name": "Chemistry and Camera Complex"
          },
          {
            "name": "MAHLI",
            "full_name": "Mars Hand Lens Imager"
          },
          {
            "name": "MARDI",
            "full_name": "Mars Descent Imager"
          },
          {
            "name": "RHAZ",
            "full_name": "Rear Hazard Avoidance Camera"
          }
        ]
      }
    },
    {
      "id": 86521,
      "sol": 1,
      "camera": {
        "id": 24,
        "name": "MAHLI",
        "rover_id": 5,
        "full_name": "Mars Hand Lens Imager"
      },
      "img_src": "http://mars.jpl.nasa.gov/msl-raw-images/msss/00001/mhli/0001MH0000001000E1_DXXX.jpg",
      "earth_date": "2012-08-07",
      "rover": {
        "id": 5,
        "name": "Curiosity",
        "landing_date": "2012-08-06",
        "launch_date": "2011-11-26",
        "status": "active",
        "max_sol": 2540,
        "max_date": "2019-09-28",
        "total_photos": 366206,
        "cameras": [
          {
            "name": "FHAZ",
            "full_name": "Front Hazard Avoidance Camera"
          },
          {
            "name": "NAVCAM",
            "full_name": "Navigation Camera"
          },
          {
            "name": "MAST",
            "full_name": "Mast Camera"
          },
          {
            "name": "CHEMCAM",
            "full_name": "Chemistry and Camera Complex"
          },
          {
            "name": "MAHLI",
            "full_name": "Mars Hand Lens Imager"
          },
          {
            "name": "MARDI",
            "full_name": "Mars Descent Imager"
          },
          {
            "name": "RHAZ",
            "full_name": "Rear Hazard Avoidance Camera"
          }
        ]
      }
    },
    {
      "id": 86522,
      "sol": 1,
      "camera": {
        "id": 24,
        "name": "MAHLI",
        "rover_id": 5,
        "full_name": "Mars Hand Lens Imager"
      },
      "img_src": "http://mars.jpl.nasa.gov/msl-raw-images/msss/00001/mhli/0001MH0000001000E2_DXXX.jpg",
      "earth_date": "2012-08-07",
      "rover": {
        "id": 5,
        "name": "Curiosity",
        "landing_date": "2012-08-06",
        "launch_date": "2011-11-26",
        "status": "active",
        "max_sol": 2540,
        "max_date": "2019-09-28",
        "total_photos": 366206,
        "cameras": [
          {
            "name": "FHAZ",
            "full_name": "Front Hazard Avoidance Camera"
          },
          {
            "name": "NAVCAM",
            "full_name": "Navigation Camera"
          },
          {
            "name": "MAST",
            "full_name": "Mast Camera"
          },
          {
            "name": "CHEMCAM",
            "full_name": "Chemistry and Camera Complex"
          },
          {
            "name": "MAHLI",
            "full_name": "Mars Hand Lens Imager"
          },
          {
            "name": "MARDI",
            "full_name": "Mars Descent Imager"
          },
          {
            "name": "RHAZ",
            "full_name": "Rear Hazard Avoidance Camera"
          }
        ]
      }
    },
    {
      "id": 86523,
      "sol": 1,
      "camera": {
        "id": 24,
        "name": "MAHLI",
        "rover_id": 5,
        "full_name": "Mars Hand Lens Imager"
      },
      "img_src": "http://mars.jpl.nasa.gov/msl-raw-images/msss/00001/mhli/0001MH0000002000I1_DXXX.jpg",
      "earth_date": "2012-08-07",
      "rover": {
        "id": 5,
        "name": "Curiosity",
        "landing_date": "2012-08-06",
        "launch_date": "2011-11-26",
        "status": "active",
        "max_sol": 2540,
        "max_date": "2019-09-28",
        "total_photos": 366206,
        "cameras": [
          {
            "name": "FHAZ",
            "full_name": "Front Hazard Avoidance Camera"
          },
          {
            "name": "NAVCAM",
            "full_name": "Navigation Camera"
          },
          {
            "name": "MAST",
            "full_name": "Mast Camera"
          },
          {
            "name": "CHEMCAM",
            "full_name": "Chemistry and Camera Complex"
          },
          {
            "name": "MAHLI",
            "full_name": "Mars Hand Lens Imager"
          },
          {
            "name": "MARDI",
            "full_name": "Mars Descent Imager"
          },
          {
            "name": "RHAZ",
            "full_name": "Rear Hazard Avoidance Camera"
          }
        ]
      }
    },
    {
      "id": 86524,
      "sol": 1,
      "camera": {
        "id": 24,
        "name": "MAHLI",
        "rover_id": 5,
        "full_name": "Mars Hand Lens Imager"
      },
      "img_src": "http://mars.jpl.nasa.gov/msl-raw-images/msss/00001/mhli/0001MH0000002000I2_DXXX.jpg",
      "earth_date": "2012-08-07",
      "rover": {
        "id": 5,
        "name": "Curiosity",
        "landing_date": "2012-08-06",
        "launch_date": "2011-11-26",
        "status": "active",
        "max_sol": 2540,
        "max_date": "2019-09-28",
        "total_photos": 366206,
        "cameras": [
          {
            "name": "FHAZ",
            "full_name": "Front Hazard Avoidance Camera"
          },
          {
            "name": "NAVCAM",
            "full_name": "Navigation Camera"
          },
          {
            "name": "MAST",
            "full_name": "Mast Camera"
          },
          {
            "name": "CHEMCAM",
            "full_name": "Chemistry and Camera Complex"
          },
          {
            "name": "MAHLI",
            "full_name": "Mars Hand Lens Imager"
          },
          {
            "name": "MARDI",
            "full_name": "Mars Descent Imager"
          },
          {
            "name": "RHAZ",
            "full_name": "Rear Hazard Avoidance Camera"
          }
        ]
      }
    },
    {
      "id": 86525,
      "sol": 1,
      "camera": {
        "id": 24,
        "name": "MAHLI",
        "rover_id": 5,
        "full_name": "Mars Hand Lens Imager"
      },
      "img_src": "http://mars.jpl.nasa.gov/msl-raw-images/msss/00001/mhli/0001MH0000001000I1_DXXX.jpg",
      "earth_date": "2012-08-07",
      "rover": {
        "id": 5,
        "name": "Curiosity",
        "landing_date": "2012-08-06",
        "launch_date": "2011-11-26",
        "status": "active",
        "max_sol": 2540,
        "max_date": "2019-09-28",
        "total_photos": 366206,
        "cameras": [
          {
            "name": "FHAZ",
            "full_name": "Front Hazard Avoidance Camera"
          },
          {
            "name": "NAVCAM",
            "full_name": "Navigation Camera"
          },
          {
            "name": "MAST",
            "full_name": "Mast Camera"
          },
          {
            "name": "CHEMCAM",
            "full_name": "Chemistry and Camera Complex"
          },
          {
            "name": "MAHLI",
            "full_name": "Mars Hand Lens Imager"
          },
          {
            "name": "MARDI",
            "full_name": "Mars Descent Imager"
          },
          {
            "name": "RHAZ",
            "full_name": "Rear Hazard Avoidance Camera"
          }
        ]
      }
    },
    {
      "id": 86526,
      "sol": 1,
      "camera": {
        "id": 24,
        "name": "MAHLI",
        "rover_id": 5,
        "full_name": "Mars Hand Lens Imager"
      },
      "img_src": "http://mars.jpl.nasa.gov/msl-raw-images/msss/00001/mhli/0001MH0000001000I2_DXXX.jpg",
      "earth_date": "2012-08-07",
      "rover": {
        "id": 5,
        "name": "Curiosity",
        "landing_date": "2012-08-06",
        "launch_date": "2011-11-26",
        "status": "active",
        "max_sol": 2540,
        "max_date": "2019-09-28",
        "total_photos": 366206,
        "cameras": [
          {
            "name": "FHAZ",
            "full_name": "Front Hazard Avoidance Camera"
          },
          {
            "name": "NAVCAM",
            "full_name": "Navigation Camera"
          },
          {
            "name": "MAST",
            "full_name": "Mast Camera"
          },
          {
            "name": "CHEMCAM",
            "full_name": "Chemistry and Camera Complex"
          },
          {
            "name": "MAHLI",
            "full_name": "Mars Hand Lens Imager"
          },
          {
            "name": "MARDI",
            "full_name": "Mars Descent Imager"
          },
          {
            "name": "RHAZ",
            "full_name": "Rear Hazard Avoidance Camera"
          }
        ]
      }
    },
    {
      "id": 2097,
      "sol": 1,
      "camera": {
        "id": 26,
        "name": "NAVCAM",
        "rover_id": 5,
        "full_name": "Navigation Camera"
      },
      "img_src": "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/00001/opgs/edr/ncam/NLA_397586928EDR_F0010008AUT_04096M_.JPG",
      "earth_date": "2012-08-07",
      "rover": {
        "id": 5,
        "name": "Curiosity",
        "landing_date": "2012-08-06",
        "launch_date": "2011-11-26",
        "status": "active",
        "max_sol": 2540,
        "max_date": "2019-09-28",
        "total_photos": 366206,
        "cameras": [
          {
            "name": "FHAZ",
            "full_name": "Front Hazard Avoidance Camera"
          },
          {
            "name": "NAVCAM",
            "full_name": "Navigation Camera"
          },
          {
            "name": "MAST",
            "full_name": "Mast Camera"
          },
          {
            "name": "CHEMCAM",
            "full_name": "Chemistry and Camera Complex"
          },
          {
            "name": "MAHLI",
            "full_name": "Mars Hand Lens Imager"
          },
          {
            "name": "MARDI",
            "full_name": "Mars Descent Imager"
          },
          {
            "name": "RHAZ",
            "full_name": "Rear Hazard Avoidance Camera"
          }
        ]
      }
    },
    {
      "id": 2674,
      "sol": 1,
      "camera": {
        "id": 26,
        "name": "NAVCAM",
        "rover_id": 5,
        "full_name": "Navigation Camera"
      },
      "img_src": "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/00001/opgs/edr/ncam/NRA_397586928EDR_F0010008AUT_04096M_.JPG",
      "earth_date": "2012-08-07",
      "rover": {
        "id": 5,
        "name": "Curiosity",
        "landing_date": "2012-08-06",
        "launch_date": "2011-11-26",
        "status": "active",
        "max_sol": 2540,
        "max_date": "2019-09-28",
        "total_photos": 366206,
        "cameras": [
          {
            "name": "FHAZ",
            "full_name": "Front Hazard Avoidance Camera"
          },
          {
            "name": "NAVCAM",
            "full_name": "Navigation Camera"
          },
          {
            "name": "MAST",
            "full_name": "Mast Camera"
          },
          {
            "name": "CHEMCAM",
            "full_name": "Chemistry and Camera Complex"
          },
          {
            "name": "MAHLI",
            "full_name": "Mars Hand Lens Imager"
          },
          {
            "name": "MARDI",
            "full_name": "Mars Descent Imager"
          },
          {
            "name": "RHAZ",
            "full_name": "Rear Hazard Avoidance Camera"
          }
        ]
      }
    },
    {
      "id": 32445,
      "sol": 1,
      "camera": {
        "id": 26,
        "name": "NAVCAM",
        "rover_id": 5,
        "full_name": "Navigation Camera"
      },
      "img_src": "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/00001/opgs/edr/ncam/NLA_397586934EDR_F0010008AUT_04096M_.JPG",
      "earth_date": "2012-08-07",
      "rover": {
        "id": 5,
        "name": "Curiosity",
        "landing_date": "2012-08-06",
        "launch_date": "2011-11-26",
        "status": "active",
        "max_sol": 2540,
        "max_date": "2019-09-28",
        "total_photos": 366206,
        "cameras": [
          {
            "name": "FHAZ",
            "full_name": "Front Hazard Avoidance Camera"
          },
          {
            "name": "NAVCAM",
            "full_name": "Navigation Camera"
          },
          {
            "name": "MAST",
            "full_name": "Mast Camera"
          },
          {
            "name": "CHEMCAM",
            "full_name": "Chemistry and Camera Complex"
          },
          {
            "name": "MAHLI",
            "full_name": "Mars Hand Lens Imager"
          },
          {
            "name": "MARDI",
            "full_name": "Mars Descent Imager"
          },
          {
            "name": "RHAZ",
            "full_name": "Rear Hazard Avoidance Camera"
          }
        ]
      }
    },
    {
      "id": 49201,
      "sol": 1,
      "camera": {
        "id": 26,
        "name": "NAVCAM",
        "rover_id": 5,
        "full_name": "Navigation Camera"
      },
      "img_src": "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/00001/opgs/edr/ncam/NRA_397586934EDR_F0010008AUT_04096M_.JPG",
      "earth_date": "2012-08-07",
      "rover": {
        "id": 5,
        "name": "Curiosity",
        "landing_date": "2012-08-06",
        "launch_date": "2011-11-26",
        "status": "active",
        "max_sol": 2540,
        "max_date": "2019-09-28",
        "total_photos": 366206,
        "cameras": [
          {
            "name": "FHAZ",
            "full_name": "Front Hazard Avoidance Camera"
          },
          {
            "name": "NAVCAM",
            "full_name": "Navigation Camera"
          },
          {
            "name": "MAST",
            "full_name": "Mast Camera"
          },
          {
            "name": "CHEMCAM",
            "full_name": "Chemistry and Camera Complex"
          },
          {
            "name": "MAHLI",
            "full_name": "Mars Hand Lens Imager"
          },
          {
            "name": "MARDI",
            "full_name": "Mars Descent Imager"
          },
          {
            "name": "RHAZ",
            "full_name": "Rear Hazard Avoidance Camera"
          }
        ]
      }
    }
    ]
    }
    """.data(using: .utf8)!
    let error = NSError(domain: "com.test", code: 100, userInfo: nil)
    

}



struct MockLoader: NetworkDataLoader {
    let data: Data?
    let error: Error?
    
    func loadData(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        DispatchQueue.global().async {
            completion(self.data, self.error)
        }
        
    }
    
    func loadData(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
        DispatchQueue.global().async {
            completion(self.data, self.error)
        }
    }
}
