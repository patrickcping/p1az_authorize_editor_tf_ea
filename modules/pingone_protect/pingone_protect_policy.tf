resource "pingone_risk_predictor" "my_awesome_anonymous_network_predictor" {
  environment_id = var.pingone_environment_id
  name           = format("%sMy Awesome Anonymous Network Predictor", var.configuration_prefix)
  compact_name   = "myAwesomeAnonymousNetworkPredictor"

  default = {
    result = {
      level = "MEDIUM"
    }
  }

  predictor_anonymous_network = {
    allowed_cidr_list = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/24"]
  }
}

resource "pingone_risk_predictor" "my_awesome_user_location_predictor" {
  environment_id = var.pingone_environment_id
  name           = format("%sMy Awesome User Location Predictor", var.configuration_prefix)
  compact_name   = "myAwesomeUserLocationPredictor"

  default = {
    result = {
      level = "MEDIUM"
    }
  }

  predictor_user_location_anomaly = {
    radius = {
      distance = 100
      unit     = "miles"
    }
  }
}

resource "pingone_risk_predictor" "my_awesome_geovelocity_anomaly_predictor" {
  environment_id = var.pingone_environment_id
  name           = format("%sMy Awesome Geovelocity Predictor", var.configuration_prefix)
  compact_name   = "myAwesomeGeovelocityPredictor"

  default = {
    result = {
      level = "MEDIUM"
    }
  }

  predictor_geovelocity = {
    allowed_cidr_list = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/24"]
  }
}

resource "pingone_risk_policy" "my_awesome_scores_risk_policy" {
  environment_id = var.pingone_environment_id

  name = format("%sMy Awesome Scores-based Risk Policy", var.configuration_prefix)

  policy_scores = {
    policy_threshold_medium = {
      min_score = 40
    }

    policy_threshold_high = {
      min_score = 75
    }

    predictors = [
      {
        compact_name = pingone_risk_predictor.my_awesome_anonymous_network_predictor.compact_name
        score        = 50
      },
      {
        compact_name = pingone_risk_predictor.my_awesome_user_location_predictor.compact_name
        score        = 50
      }
    ]
  }

  overrides = [
    {
      result = {
        level = "LOW"
      }

      condition = {
        type = "IP_RANGE"
        ip_range = [
          "10.0.0.0/8",
        ]
      }
    },

    {
      result = {
        level = "HIGH"
      }

      condition = {
        type         = "VALUE_COMPARISON"
        compact_name = pingone_risk_predictor.my_awesome_geovelocity_anomaly_predictor.compact_name
        equals       = "HIGH"
      }
    }
  ]
}